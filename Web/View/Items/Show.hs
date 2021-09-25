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
        <div class="my-4">
            <h1>Show Item</h1>
            <div>{get #title item}</div>
            <div>Status: {get #status item}</div>
        </div>
        <a href={NewBidAction (get #id item)}>Add Bid</a>
        <ol>{forEach (get #bids item) renderBid}</ol>
    |]

renderBid bid = [hsx|
    <li class="mt-4">
        <a href={EditBidAction (get #id bid)}>Edit Bid</a>
        <div>Price: ${get #price bid}</div>
        <div>Status: {get #status bid}</div>
        <div>{get #createdAt bid |> timeAgo}</div>
    </li>
|]