module Web.Controller.Bids where

import Web.Controller.Prelude
import Web.View.Bids.Index
import Web.View.Bids.New
import Web.View.Bids.Edit
import Web.View.Bids.Show
import Control.Concurrent.MVar

instance Controller BidsController where
    action BidsAction = do
        bids <- query @Bid |> fetch
        render IndexView { .. }

    action NewBidAction { itemId }= do
        let bid = newRecord
                |> set #itemId itemId
                -- Internet bid type by default.
                |> set #bidType Internet
        item <- fetch itemId
        itemBids <- fetch (get #bids item)
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
        m <- newEmptyMVar
        let bid = newRecord @Bid
        bid
            |> buildBidCreate
            >>= ifValid \case
                Left bid -> do
                    item <- fetch (get #itemId bid)
                    itemBids <- fetch (get #bids item)
                    render NewView { .. }
                Right bid -> do
                    bid <- bid |> createRecord
                    setSuccessMessage "Bid created"
                    redirectTo (ShowItemAction (get #itemId bid))

    action DeleteBidAction { bidId } = do
        bid <- fetch bidId
        deleteRecord bid
        setSuccessMessage "Bid deleted"
        redirectTo (ShowItemAction (get #itemId bid))



buildBidCreate bid = bid
    |> fill @["itemId","status","price", "bidType"]
    |> validateField #price (isGreaterThan 0)
    |> validateIsPriceAboveOtherBids

buildBidUpdate bid = bid
    |> fill @'["status"]

validateIsPriceAboveOtherBids bid = do
    item <- fetch (get #itemId bid)
    mwinningBid <- getWinningBid item

    case mwinningBid of
        Nothing ->
            -- No winning bid.
            pure bid
        Just winningBid ->
            bid
                |> validateField #price (isGreaterThan price |> withCustomErrorMessage ("Price should be higher than the currently highest price: " ++ show price))
                |> pure
            where
                price = get #price winningBid


