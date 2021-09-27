module Web.Controller.Items where

import Web.Controller.Prelude
import Web.View.Items.Index
import Web.View.Items.New
import Web.View.Items.Edit
import Web.View.Items.Show
import Web.View.Prelude (hsx)

instance Controller ItemsController where
    action ItemsAction = do
        items <- query @Item |> fetch
        render IndexView { .. }

    action NewItemAction = do
        let item = newRecord
        render NewView { .. }

    action ShowItemAction { itemId } = autoRefresh do
        item <- fetch itemId
            >>= pure . modify #bids (orderByDesc #createdAt)
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
            >>= ifValid \case
                Left item -> render EditView { .. }
                Right item -> do
                    item <- item |> updateRecord
                    setSuccessMessage "Item updated"
                    redirectTo EditItemAction { .. }

    action CreateItemAction = do
        let item = newRecord @Item
        item
            |> buildItem
            |> set #status Inactive
            |> validateNoOtherActiveItem
            >>= ifValid \case
                Left item -> render NewView { .. }
                Right item -> do
                    item <- item |> createRecord
                    setSuccessMessage "Item created"
                    redirectTo ItemsAction

    action DeleteItemAction { itemId } = do
        item <- fetch itemId
        deleteRecord item
        setSuccessMessage "Item deleted"
        redirectTo ItemsAction

buildItem item = item
     |> fill @'["title", "status"]



{-| Validate that no other Item is already Active.
|-}
validateNoOtherActiveItem item = do
    activeItems <- query @Item
        |> filterWhere (#status, Active)
        |> fetchCount

    if activeItems == 0 then
        pure item
    else
        item
            |> attachFailure #status (show errorHtml)
            |> pure
    where
        errorHtml = [hsx|
                Another Item is already marked as Active.
            |]






