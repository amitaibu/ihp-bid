module Web.View.Bids.Edit where
import Web.View.Prelude

data EditView = EditView { bid :: Bid }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={BidsAction}>Bids</a></li>
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
    {(numberField #price)}
    {submitButton}
|]
