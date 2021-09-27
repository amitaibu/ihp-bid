module Web.View.Bids.Edit where
import Web.View.Prelude

data EditView = EditView
    { bid :: Bid
    , item :: Item
    }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ShowItemAction (get #itemId bid)}>Item {get #title item}</a></li>
                <li class="breadcrumb-item active">Edit Bid</li>
            </ol>
        </nav>
        <h1>Edit Bid</h1>
        {renderForm bid}
    |]

renderForm :: Bid -> Html
renderForm bid = formFor bid [hsx|
    {(hiddenField #itemId)}
    {(hiddenField #status)}
    {(numberField #price) { disabled = True }}
    {submitButton}
|]
