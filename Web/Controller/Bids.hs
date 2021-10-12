module Web.Controller.Bids where

import Web.Controller.Prelude
import Web.View.Bids.Edit
import Web.View.Bids.Index
import Web.View.Bids.New
import Web.View.Bids.Show

import Control.Concurrent (forkIO, threadDelay)

instance Controller BidsController where
    action BidsAction = do
        bids <- query @Bid |> fetch
        render IndexView{..}
    action NewBidAction{itemId} = do
        item <-
            fetch itemId
                >>= fetchRelated #bids

        let bidType =
                case get #status item of
                    Active -> Internet
                    _ -> Mail

        let bid' =
                newRecord
                    |> set #itemId itemId
                    |> set #bidType bidType
                    -- Default opening price
                    |> set #price 10

        let winningBid = getWinningBid item

        let bid =
                case winningBid of
                    Nothing -> bid'
                    Just winningBid ->
                        bid'
                            |> set #price (winningBidPrice + 10)
                      where
                        winningBidPrice = get #price winningBid

        render NewView{..}
    action ShowBidAction{bidId} = do
        bid <- fetch bidId
        render ShowView{..}
    action EditBidAction{bidId} = do
        bid <- fetch bidId
        item <- fetch (get #itemId bid)
        render EditView{..}
    action UpdateBidAction{bidId} = do
        bid <- fetch bidId
        bid
            |> fill @'["status"]
            |> ifValid \case
                Left bid -> do
                    item <- fetch (get #itemId bid)
                    render EditView{..}
                Right bid -> do
                    bid <- bid |> updateRecord
                    setSuccessMessage "Bid updated"
                    redirectTo (ShowItemAction (get #itemId bid))
    action CreateBidAction = do
        let bid =
                newRecord @Bid
                    |> fill @["itemId", "price", "bidType"]
                    |> set #status Queued

        item <-
            fetch (get #itemId bid)
                >>= fetchRelated #bids

        bid
            |> validateType item
            -- |> validateIsPriceAboveOtherBids item
            |> ifValid \case
                Left bid -> do
                    let winningBid = getWinningBid item
                    render NewView{..}
                Right bid -> do
                    bid <- bid |> create

                    -- Create a Job for the Bid to be processed.
                    newRecord @BidJob
                        |> set #bidId (get #id bid)
                        |> create

                    setSuccessMessage "Bid registered"
                    redirectTo (ShowItemAction (get #itemId bid))
    action DeleteBidAction{bidId} = do
        bid <- fetch bidId
        deleteRecord bid
        setSuccessMessage "Bid deleted"
        redirectTo (ShowItemAction (get #itemId bid))

validateType :: Include "bids" Item -> Bid -> Bid
validateType item bid = do
    let bidType = get #bidType bid

    case get #status item of
        Active ->
            if bidType `elem` [Mail, Agent]
                then bid |> attachFailure #bidType ("Item is active, so Bid cannot be of type " ++ show bidType)
                else bid
        Inactive ->
            if bidType == Internet
                then bid |> attachFailure #bidType ("Item is Inactive, so Bid cannot be of type " ++ show bidType)
                else bid

validateIsPriceAboveOtherBids :: Include "bids" Item -> Bid -> Bid
validateIsPriceAboveOtherBids item bid = do
    case getWinningBid item of
        Nothing ->
            -- No winning bid, so validate above 0.
            bid
                |> validateField #price (isGreaterThan 0)
        Just winningBid ->
            -- Make sure we don't validate against self Bid.
            if get #id winningBid == get #id bid
                then bid
                else bid |> validateField #price (isGreaterThan price |> withCustomErrorMessage "Price too low")
          where
            price = get #price winningBid

getWinningBid item =
    do
        item
        |> get #bids
        |> filter (\bid -> get #status bid == Accepted)
        |> foldr
            ( \bid accum ->
                case accum of
                    Nothing ->
                            Just bid
                    Just highestBid ->
                        if get #price bid > get #price highestBid
                            then Just bid
                            else accum
            )
            Nothing

isWinningBid item bid =
    case getWinningBid item of
        Nothing -> False
        Just winningBid -> get #id winningBid == get #id bid
