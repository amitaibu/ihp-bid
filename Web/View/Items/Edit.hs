module Web.View.Items.Edit where
import Web.View.Prelude

data EditView = EditView { item :: Item }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ItemsAction}>Items</a></li>
                <li class="breadcrumb-item active">Edit Item</li>
            </ol>
        </nav>
        <h1>Edit Item</h1>
        {renderForm item}
    |]

renderForm :: Item -> Html
renderForm item = formFor item [hsx|
    {(textField #title)}
    {selectField #status allStatus}
    {submitButton}
|]
    where 
        allStatus = allEnumValues @ItemStatus

instance CanSelect ItemStatus where
    type SelectValue ItemStatus = ItemStatus
    selectValue value = value
    selectLabel = tshow