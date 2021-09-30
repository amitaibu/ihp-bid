module Web.Controller.Items where

import Web.Controller.Prelude
import Web.View.Items.Index
import Web.View.Items.New
import Web.View.Items.Edit
import Web.View.Items.Show
import Web.View.Prelude (hsx)

instance Controller ItemsController where
    action ItemsAction = do
        items <- query @Item
                |> fetch
                >>= collectionFetchRelated #bids

        render IndexView { .. }

    action NewItemAction = do
        let item = newRecord
        render NewView { .. }

    action ShowItemAction { itemId } = autoRefresh do
        item <- fetch itemId
            >>= pure . modify #bids (orderBy #createdAt)
            >>= fetchRelated #bids
        render ShowView { .. }

    action EditItemAction { itemId } = do
        item <- fetch itemId
        render EditView { .. }

    action UpdateItemAction { itemId } = do
        item <- fetch itemId
        item
            |> buildItem
            |> validateNoOtherActiveItem
            >>= validateNoRecentBid
            >>= ifValid \case
                Left item -> render EditView { .. }
                Right item -> do
                    item <- item |> updateRecord
                    setSuccessMessage "Item updated"
                    redirectTo ShowItemAction { .. }

    action CreateItemAction = do
        let item = newRecord @Item
        item
            |> buildItem
            |> set #status Inactive
            |> ifValid \case
                Left item -> render NewView { .. }
                Right item -> do
                    item <- item |> createRecord
                    setSuccessMessage "Item created"
                    redirectTo ItemsAction

    action DeleteItemAction { itemId } = do
        item <- fetch itemId
        bids <- fetch (get #bids item)
        accessDeniedUnless (null bids)
        deleteRecord item
        setSuccessMessage "Item deleted"
        redirectTo ItemsAction



buildItem item = item
     |> fill @'["title", "status"]



{-| Validate that no other Item is already Active.
-}
validateNoOtherActiveItem item = do
    activeItems <- query @Item
        |> filterWhere (#status, Active)
        |> filterWhereNot (#id, get #id item)
        |> fetchCount

    if activeItems == 0 then
        -- No change.
        pure item
    else
        item
            |> attachFailure #status "Another Item is already marked as Active."
            |> pure



{-| If a Bid was submitted less than the a number of a seconds, don't allow switching an Active item to
Inactive.
-}


validateNoRecentBid item = do
    -- @todo: Get diff seconds from config.
    let seconds = 20
    currentTime <- getCurrentTime
    originalItem <- fetch (get #id item)
    bids <- get #bids item
        |> orderByDesc #createdAt
        |> limit 1
        |> fetch

    case bids of
        [] ->
            -- No bids, so no change.
            pure item

        (bid: _) -> do
            let bidCreatedAt = get #createdAt bid |> debug
            let currentTimeDiffInSeconds = diffUTCTime currentTime bidCreatedAt
                        |> nominalDiffTimeToSeconds

            if get #status originalItem == Active && get #status item == Inactive && currentTimeDiffInSeconds < seconds
                then
                    item
                        |> attachFailure #status ("Last bid was created less than " ++ show seconds ++ " seconds ago: " ++ show currentTimeDiffInSeconds)
                        |> pure
                else
                    -- No change.
                    pure item









