module Web.Job.Bid where
import Web.Controller.Prelude
import Web.Controller.Bids

instance Job BidJob where
    perform BidJob { .. } = do
        bid <- fetch bidId
        item <- fetch (get #itemId bid)
                >>= pure . modify #bids (orderBy #createdAt)
                >>= fetchRelated #bids


        bid
            |> validateType item
            |> validateIsPriceAboveOtherBids item

            >>= ifValid \case
            Left bid -> do
                -- @todo: Save error
                bid
                    |>set #status Rejected
                    |> updateRecord


            Right bid -> do
                bid
                    |>set #status Accepted
                    |> updateRecord


    maxAttempts = 1
