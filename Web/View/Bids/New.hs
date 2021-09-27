module Web.View.Bids.New where
import Web.View.Prelude

data NewView = NewView
    { bid :: Bid
    , item :: Item
    , itemBids :: [Bid]
    }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ShowItemAction (get #itemId bid)}>Item {get #title item}</a></li>
                <li class="breadcrumb-item active">New Bid</li>
            </ol>
        </nav>
        <h1>New Bid</h1>
        {renderForm itemBids bid}
    |]

renderForm :: [Bid] -> Bid -> Html
renderForm itemBids bid =
    formFor bid [hsx|
        {(hiddenField #itemId)}
        {(hiddenField #status)}
        {(numberField #price) {
             helpText =
                if highestBidPrice > 0
                    then "Price should be above the current highest Bid which is " ++ show highestBidPrice
                    else ""
            }
        }
        {submitButton}
    |]
    where
        highestBidPrice =
            map (get #price) itemBids
                |> maximum'


-- @todo: Remove duplication. Where to move?
maximum' :: (Num a, Ord a) => [a] -> a
maximum' [] = 0
maximum' xs = foldr1 (\x y ->if x >= y then x else y) xs
