module Web.View.Items.Show where
import Web.View.Prelude

data ShowView = ShowView { item :: Include "bids" Item }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ItemsAction}>Items</a></li>
                <li class="breadcrumb-item active">Show Item</li>
            </ol>
        </nav>
        <h1>Show Item</h1>
        <p>{get #title item}</p>
        <a href={NewBidAction (get #id item)}>Add Bid</a>
        <div>{forEach (get #bids item) renderBid}</div>
    |]

renderBid bid = [hsx|
    <div class="mt-4">
        <h5>{get #id bid}</h5>
        <p>{get #price bid}</p>
    </div>
|]