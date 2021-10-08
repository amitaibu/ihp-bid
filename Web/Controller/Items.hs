module Web.Controller.Items where

import Web.Controller.Prelude
import Web.View.Items.Index
import Web.View.Items.New
import Web.View.Items.Edit
import Web.View.Items.Show
import Web.View.Prelude (hsx)
import qualified Data.TMap as TMap
import Config

instance Controller ItemsController where
    action ItemsAction = do
        items <- query @Item
                |> orderByDesc #createdAt
                |> fetch
                >>= collectionFetchRelated #bids

        render IndexView { .. }

    action NewItemAction = do
        let item = newRecord
        let bidSteps = take (paramOrDefault 1 "bidSteps") $ repeat $ newRecord @BidStep

        render NewView { .. }

    action ShowItemAction { itemId } = autoRefresh do
        item <- fetch itemId
            >>= pure . modify #bids (orderBy #createdAt)
            >>= fetchRelated #bids
            >>= fetchRelated #bidSteps

        render ShowView { .. }

    action EditItemAction { itemId } = do
        item <- fetch itemId
        render EditView { .. }

    action UpdateItemAction { itemId } = do
        item <- fetch itemId
        item
            |> buildItem
            -- |> validateNoOtherActiveItem
            |> validateNoRecentBid
            >>= ifValid \case
                Left item -> render EditView { .. }
                Right item -> do
                    item <- item |> updateRecord
                    setSuccessMessage "Item updated"
                    redirectTo ShowItemAction { .. }

    action CreateItemAction = do
        let item = newRecord @Item
        let bidSteps = take (paramOrDefault 1 "bidSteps") $ repeat $ newRecord @BidStep

        item
            |> buildItem
            |> set #status Active
            |> ifValid \case
                Left item -> render NewView { .. }
                Right item -> do
                        let mins :: [Int] = paramList "min"
                        let maxs :: [Int] = paramList "max"
                        let steps :: [Int] = paramList "max"


                        let bidSteps = zip3 mins maxs steps
                                |> map (\(min, max, step) -> newRecord @BidStep
                                        |> set #min min
                                        |> set #max max
                                        |> set #step step
                                        |> validateField #min (isGreaterThan 0)
                                        |> validateField #min (isGreaterThan 0)
                                        |> validateField #max (isGreaterThan 0)
                                        |> validateField #step (isGreaterThan 0)
                                    )

                        validatedBidSteps :: [Either BidStep BidStep] <- forM bidSteps (ifValid (\bidStep -> pure bidStep))

                        case partitionEithers validatedBidSteps of
                            ([], bidSteps) -> do
                                item <- item |> createRecord

                                -- Set the Item reference on the Bid steps.
                                let itemId = get #id item
                                let bidStepsWithUpdatedItemId = map (\bidStep -> bidStep |> set #itemId itemId) bidSteps
                                bidSteps <- createMany bidStepsWithUpdatedItemId
                                setSuccessMessage "Item created"

                                redirectTo ItemsAction

                            (invalidBidSteps, validBidSteps) -> render NewView {..}



    action DeleteItemAction { itemId } = do
        item <- fetch itemId
        bids <- fetch (get #bids item)
        accessDeniedUnless (null bids)
        deleteRecord item
        setSuccessMessage "Item deleted"
        redirectTo ItemsAction



buildItem item = item
     |> fill @'["title", "status"]
     |> validateField #title nonEmpty


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
    let appConfig = ?context |> getFrameworkConfig |> get #appConfig
    let (BidPreventItemSwitchToInactiveRecentBidDiffSeconds seconds) = appConfig
               |> TMap.lookup @BidPreventItemSwitchToInactiveRecentBidDiffSeconds
               |> fromMaybe (error "Could not find BidPreventItemSwitchToInactiveRecentBidDiffSeconds in config")

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









