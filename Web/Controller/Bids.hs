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
    |> set #status Rejected
    |> set #bidType Internet
    |> validateIsPriceAboveOtherBids

buildBidUpdate bid = bid
    |> fill @'["status"]

validateIsPriceAboveOtherBids bid = do
    item <- fetch (get #itemId bid)

    bids <- fetch (get #bids item)
    let prices = map (get #price) bids
    let highestBidPrice = maximum' prices
    bid
        |> validateField #price (isGreaterThan highestBidPrice |> withCustomErrorMessage ("Price should be higher than the currently highest price: " ++ show highestBidPrice))
        |> pure
    where
        maximum' :: (Num a, Ord a) => [a] -> a
        maximum' [] = 0
        maximum' xs = foldr1 (\x y ->if x >= y then x else y) xs




