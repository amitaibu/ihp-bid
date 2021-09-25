module Web.View.Bids.Index where
import Web.View.Prelude

data IndexView = IndexView { bids :: [Bid] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={BidsAction}>Bids</a></li>
            </ol>
        </nav>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Bid</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach bids renderBid}</tbody>
            </table>
        </div>
    |]


renderBid :: Bid -> Html
renderBid bid = [hsx|
    <tr>
        <td>{bid}</td>
        <td><a href={ShowBidAction (get #id bid)}>Show</a></td>
        <td><a href={EditBidAction (get #id bid)} class="text-muted">Edit</a></td>
        <td><a href={DeleteBidAction (get #id bid)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
