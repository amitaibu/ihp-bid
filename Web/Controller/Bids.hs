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
                -- Default opening price
                |> set #price 10

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
        let bid = newRecord @Bid
                |> fill @["itemId", "price", "bidType"]
                |> set #status Queued

        item <- fetch (get #itemId bid)
                >>= pure . modify #bids (orderBy #createdAt)
                >>= fetchRelated #bids

        bid
            |> validateType item
            |> ifValid \case
                Left bid -> do
                    item <- fetch (get #itemId bid)
                    itemBids <- fetch (get #bids item)
                    render NewView { .. }

                Right bid -> do
                    bid |> create

                    -- Create a Job for the Bid to be processed.
                    newRecord @BidJob
                        |> set #bidId (get #id bid)
                        |> create

                    setSuccessMessage $ "Bid registered"
                    redirectTo (ShowItemAction (get #itemId bid))


    action DeleteBidAction { bidId } = do
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

buildBidUpdate :: (?context::ControllerContext, ?modelContext::ModelContext) => Bid -> Bid
buildBidUpdate bid = bid
    |> fill @'["status"]

getWinningBid :: [Bid] -> Maybe Bid
getWinningBid bids = do
    case bids of
        [] -> Nothing
        xs -> foldr (\bid accum ->
            case accum of
                Nothing ->
                    if get #status bid /= Accepted
                        then accum
                        else Just bid
                Just highestBid ->
                    if get #status highestBid /= Accepted  || get #price bid > get #price highestBid then
                        -- Skip any non accepted items, or Bids with lower price.
                        accum
                    else
                        Just highestBid
            ) Nothing xs
