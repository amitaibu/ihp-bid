module Web.View.Bids.New where
import Web.View.Prelude

data NewView = NewView 
    { bid :: Bid 
    , item :: Item
    }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={BidsAction}>Bids</a></li>
                <li class="breadcrumb-item active">New Bid</li>
            </ol>
        </nav>
        <h1>New Bid</h1>
        {renderForm bid}
    |]

renderForm :: Bid -> Html
renderForm bid = formFor bid [hsx|
    {(hiddenField #itemId)}
    {(textField #status)}
    {(textField #price)}
    {submitButton}
|]
