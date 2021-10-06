module Web.Controller.Bids where

import Web.Controller.Prelude
import Web.View.Bids.Index
import Web.View.Bids.New
import Web.View.Bids.Edit
import Web.View.Bids.Show

import Control.Concurrent ( forkIO, threadDelay )



instance Controller BidsController where
    action BidsAction = do
        bids <- query @Bid |> fetch
        render IndexView { .. }

    action NewBidAction { itemId }= do
        item <- fetch itemId
        itemBids <- fetch (get #bids item)

        let bid' = newRecord
                |> set #itemId itemId
                -- Internet bid type by default.
                |> set #bidType Internet

        let bid =
                case getWinningBid itemBids of
                    Nothing -> bid'
                    Just winningBid ->
                        bid'
                            |> set #price (winningBidPrice + 10)
                        where
                            winningBidPrice = get #price winningBid


        render NewView { .. }

    action ShowBidAction { bidId } = do
        bid <- fetch bidId
        render ShowView { .. }

    action EditBidAction { bidId } = do
        bid <- fetch bidId
        item <- fetch (get #itemId bid)
        render EditView { .. }

    action UpdateBidAction { bidId } = do
        bid <- fetch bidId
        bid
            |> buildBidUpdate
            |> ifValid \case
                Left bid -> do
                    item <- fetch (get #itemId bid)
                    render EditView { .. }
                Right bid -> do
                    bid <- bid |> updateRecord
                    setSuccessMessage "Bid updated"
                    redirectTo (ShowItemAction (get #itemId bid))

    action CreateBidAction = do

        -- Get global queue
        queue <- newTBQueueIO 100

        let bid = newRecord @Bid

        -- Add Bid to queue.

        mailbox <- newEmptyMVar


        -- Wait for queue to return the processed Bid.
        -- Queue should also populate the mailbox, so we'd know when it's done processing our Bid.
        atomically $ writeTBQueue queue (bid, mailbox)

        receivedBid <- takeMvar mailbox

        -- Return the response.



        bid
            |> buildBidCreate
            >>= ifValid \case
                Left bid -> do
                    item <- fetch (get #itemId bid)
                    itemBids <- fetch (get #bids item)
                    render NewView { .. }
                Right bid -> do
                    bid <- bid |> createRecord

                    forkIO $ createMailBid bid

                    setSuccessMessage "Bid created"
                    redirectTo (ShowItemAction (get #itemId bid))

    action DeleteBidAction { bidId } = do
        bid <- fetch bidId
        deleteRecord bid
        setSuccessMessage "Bid deleted"
        redirectTo (ShowItemAction (get #itemId bid))



buildBidCreate :: (?context::ControllerContext, ?modelContext::ModelContext) => Bid -> IO Bid
buildBidCreate bid = do
    let bidFilled = bid |> fill @["itemId","status","price", "bidType"]

    item <- fetch (get #itemId bidFilled)
            >>= pure . modify #bids (orderBy #createdAt)
            >>= fetchRelated #bids

    bidFilled
        |> validateType item
        |> validateIsPriceAboveOtherBids item
        |> pure

buildBidUpdate :: (?context::ControllerContext, ?modelContext::ModelContext) => Bid -> Bid
buildBidUpdate bid = bid
    |> fill @'["status"]

validateIsPriceAboveOtherBids :: Include "bids" Item -> Bid -> Bid
validateIsPriceAboveOtherBids item bid = do
    let bids = get #bids item

    case getWinningBid bids of
        Nothing ->
            -- No winning bid, so validate above 0.
            bid
                |> validateField #price (isGreaterThan 0)
        Just winningBid ->
            bid
                |> validateField #price (isGreaterThan price |> withCustomErrorMessage ("Price should be higher than the currently highest price: " ++ show price))
            where
                price = get #price winningBid


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



createMailBid :: (?modelContext::ModelContext) => Bid -> IO ()
createMailBid bid = do
    item <- fetch (get #itemId bid)
    itemBids <- fetch (get #bids item)
    mMailBid <- case getWinningBid itemBids of
        Nothing -> pure Nothing
        Just winningBid ->
            if get #bidType winningBid == Internet || get #price winningBid < 500
                then do
                    -- threadDelay (2 * 1000000)

                    mailBid <- newRecord @Bid
                            |> set #itemId (get #itemId bid)
                            -- Internet bid type by default.
                            |> set #bidType AutoMail
                            |> set #price (get #price winningBid + 10)
                            |> createRecord


                    createMailBid mailBid

                    Just mailBid |> pure
                else
                    pure Nothing

    pure ()