module Web.View.Bids.New where

import Web.View.Prelude

data NewView = NewView
    { bid :: Bid
    , item :: Include "bids" Item
    , winningBid :: Maybe Bid
    }

instance View NewView where
    html NewView{..} =
        [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ShowItemAction (get #itemId bid)}>Item {get #title item}</a></li>
                <li class="breadcrumb-item active">New Bid</li>
            </ol>
        </nav>
        <h1>New Bid</h1>
        {renderForm item winningBid bid}
    |]

renderForm :: Include "bids" Item -> Maybe Bid -> Bid -> Html
renderForm item winningBid bid =
    formFor
        bid
        [hsx|
        {(hiddenField #itemId)}
        {(hiddenField #status)}
        {(numberField #price) {
             helpText =
                if highestBidPrice > 0
                    then "Price should be above the current highest Bid which is " ++ show highestBidPrice
                    else ""
            }
        }
        {selectField #bidType selectableBidType}
        {submitButton}
    |]
  where
    highestBidPrice =
        case winningBid of
            Nothing -> 0
            Just winningBid -> get #price winningBid

    -- Auto-* bids are auto created, and cannot be created manually.
    nonSelectableBidTypes = [AutoAgent, AutoMail]
    selectableBidType =
        allEnumValues @BidType
            |> filter (\x -> x `notElem` nonSelectableBidTypes)

-- @todo: Remove duplication. Where to move?
maximum' :: (Num a, Ord a) => [a] -> a
maximum' [] = 0
maximum' xs = foldr1 (\x y -> if x >= y then x else y) xs

instance CanSelect BidType where
    type SelectValue BidType = BidType
    selectValue value = value
    selectLabel = tshow