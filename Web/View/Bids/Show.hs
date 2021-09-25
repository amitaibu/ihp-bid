module Web.View.Bids.Show where
import Web.View.Prelude

data ShowView = ShowView { bid :: Bid }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={BidsAction}>Bids</a></li>
                <li class="breadcrumb-item active">Show Bid</li>
            </ol>
        </nav>
        <h1>Show Bid</h1>
        <p>{bid}</p>
    |]
