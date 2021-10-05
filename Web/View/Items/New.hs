module Web.View.Items.New where
import Web.View.Prelude

data NewView = NewView { item :: Item, bidSteps :: [BidStep] }

instance View NewView where
    html NewView { .. } = [hsx|

        <script src={assetPath "/multiple-field.js"} />

        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ItemsAction}>Items</a></li>
                <li class="breadcrumb-item active">New Item</li>
            </ol>
        </nav>
        <h1>New Item</h1>
        {renderForm item bidSteps}
    |]

renderForm :: Item -> [BidStep] -> Html
renderForm item bidSteps = formFor item [hsx|
    {(textField #title)}

    <fieldset class="multiple-field-wrapper border p-4">
        {forEachWithIndex bidSteps renderFormBidStep}

        <div class="multiple-field-add btn btn-secondary mt-4">Add Another Bid Step</div>
    </fieldset>

    {submitButton}
|]

-- renderFormBidStep :: BidStep -> Html
renderFormBidStep (index, bidStep) = [hsx|
    <fieldset class="multiple-field border p-4">
        <h3>Bid Step</h3>
        <div class="form-group">
            <label>
                Min
            </label>
            <input type="number" name="min" value="{get #min bidStep}" class={classes ["form-control", ("is-invalid", isInvalidMin)]}/>
            {minFeedback}
        </div>

        <div class="form-group">
            <label>
                Max
            </label>
            <input type="number" name="max" value="{get #max bidStep}" class={classes ["form-control", ("is-invalid", isInvalidMax)]}/>
            {maxFeedback}
        </div>

        <div class="form-group">
            <label>
                Step
            </label>
            <input type="number" name="max" value="{get #step bidStep}" class={classes ["form-control", ("is-invalid", isInvalidStep)]}/>
            {stepFeedback}
        </div>
    </fieldset>
|]
    where
        isInvalidMin = isJust (getValidationFailure #min bidStep)
        isInvalidMax = isJust (getValidationFailure #max bidStep)
        isInvalidStep = isJust (getValidationFailure #step bidStep)

        minFeedback = case getValidationFailure #min bidStep of
            Just result -> [hsx|<div class="invalid-feedback">{result}</div>|]
            Nothing -> mempty

        maxFeedback = case getValidationFailure #max bidStep of
            Just result -> [hsx|<div class="invalid-feedback">{result}</div>|]
            Nothing -> mempty

        stepFeedback = case getValidationFailure #step bidStep of
            Just result -> [hsx|<div class="invalid-feedback">{result}</div>|]
            Nothing -> mempty