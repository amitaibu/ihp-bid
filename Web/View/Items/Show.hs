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
            <h1>{get #title item}</h1>
            <a href={EditItemAction (get #id item)}>Edit</a>
            <div>Status: {get #status item}</div>
        </div>
        <div>
            <a class="btn btn-primary mb-4" href={NewBidAction (get #id item)}>Add Bid</a>
        </div>

        {renderTable item}

    |]


renderTable item =
    if null (get #bids item)
        then
            [hsx|
                No Bids added yet
            |]
        else
            [hsx|
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Type</th>
                                <th>Time ago</th>
                                <th>Ops</th>
                            </tr>
                        </thead>
                        <tbody>
                            {forEachWithIndex (get #bids item |> reverse) (renderBid (get #bids item |> length))}
                        </tbody>
                    </table>
            |]



renderBid totalBids (index, bid) = [hsx|
    <tr>
        <td>{totalBids - index}</td>
        <td>${get #price bid}</td>
        <td>{get #status bid}</td>
        <td>{get #bidType bid}</td>
        <td>{get #createdAt bid |> timeAgo}</td>
        <td><a href={EditBidAction (get #id bid)}>Edit</a></td>
    </tr>
|]