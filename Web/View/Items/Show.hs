module Web.View.Items.Show where

import Web.Controller.Bids (getWinningBid, isWinningBid)
import Web.View.Prelude

data ShowView = ShowView
    {item :: Include' ["bids", "bidSteps"] Item}

instance View ShowView where
    html ShowView{..} =
        [hsx|
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

        {renderBidsTable item}

        {renderBidStepsTable item}

    |]

renderBidsTable item =
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
                            {forEachWithIndex (get #bids item |> reverse) (renderBid item (get #bids item |> length))}
                        </tbody>
                    </table>
            |]

renderBid item totalBids (index, bid) =
    [hsx|
    <tr class={classes [("table-success", isWinningBid item bid)]}>
        <td>{totalBids - index}</td>
        <td>${get #price bid}</td>
        <td>{get #status bid}</td>
        <td>{get #bidType bid}</td>
        <td>{get #createdAt bid |> timeAgo}</td>
        <td><a href={EditBidAction (get #id bid)}>Edit</a></td>
    </tr>
|]

renderBidStepsTable item =
    if null (get #bidSteps item)
        then
            [hsx|
                No Bid Steps added yet
            |]
        else
            [hsx|
                <details>
                    <summary>Bid Steps</summary>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Min</th>
                                <th>Max</th>
                                <th>Step</th>
                            </tr>
                        </thead>
                        <tbody>
                            {forEachWithIndex (get #bidSteps item) renderBidStep}
                        </tbody>
                    </table>
                </details>
            |]

renderBidStep (index, bidStep) =
    [hsx|
    <tr>
        <td>{index + 1}</td>
        <td>{get #min bidStep}</td>
        <td>{get #max bidStep}</td>
        <td>{get #step bidStep}</td>
    </tr>
|]
