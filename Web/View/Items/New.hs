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

    <div class="multiple-field-wrapper border p-4 my-4">

        <div class="multiple-field-inner">
            {forEachWithIndex bidSteps renderFormBidStep}

        </div>



        <div class="multiple-field-add btn btn-secondary mt-4">Add Another Bid Step</div>
    </div>

    {submitButton}
|]

-- renderFormBidStep :: BidStep -> Html
renderFormBidStep (index, bidStep) = [hsx|
    <fieldset class="multiple-field border p-4 my-4">
        <div class="d-flex flex-row justify-content-between">
            <h3>Bid Step</h3>
            <a class="multiple-field-remove" href="javascript:void(0)">X</a>
        </div>

        <div class="form-group">
            <label>
                Min
            </label>
            <input type="number" name="min"
            value={if didChange #min bidStep then inputValue (get #min bidStep) else ""}
            class={classes ["form-control", ("is-invalid", isInvalidMin)]}/>
            {minFeedback}
        </div>

        <div class="form-group">
            <label>
                Max
            </label>
            <input type="number" name="max"
            value={if didChange #max bidStep then inputValue (get #max bidStep) else ""}
            class={classes ["form-control", ("is-invalid", isInvalidMax)]}/>
            {maxFeedback}
        </div>

        <div class="form-group">
            <label>
                Step
            </label>
            <input type="number" name="max"
            value={if didChange #step bidStep then inputValue (get #step bidStep) else ""}
            class={classes ["form-control", ("is-invalid", isInvalidStep)]}/>
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