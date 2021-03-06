module Web.View.Items.Index where

import Web.View.Prelude

data IndexView = IndexView
    { items :: [Include "bids" Item]
    , pagination :: Pagination
    , bidsCount :: [(Id Item, Int)]
    }

instance View IndexView where
    html IndexView{..} =
        [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={ItemsAction}>Items</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewItemAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Status</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach items (renderItem bidsCount)}</tbody>
            </table>
            { renderPagination pagination }

        </div>
    |]

renderItem bidsCount item =
    [hsx|
    <tr>
        <td>{get #title item}</td>
        <td>{get #status item}</td>
        <td><a href={ShowItemAction (get #id item)}>Show</a></td>
        <td><a href={EditItemAction (get #id item)} class="text-muted">Edit</a></td>
        <td>{renderDeleteItem bidsCount item}</td>
    </tr>
|]

renderDeleteItem bidsCount item =
    case bidsCountFiltered of
        ((_, count) : xs) -> [hsx| Item has {count} Bid(s), so it cannot be deleted. |]
        [] -> [hsx| <a href={DeleteItemAction (get #id item)} class="js-delete text-muted">Delete</a> |]
  where
    bidsCountFiltered =
        bidsCount |> filter (\(itemId, _) -> itemId == get #id item)
