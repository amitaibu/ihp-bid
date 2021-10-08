module Web.Job.Bid where
import Web.Controller.Prelude
import Web.Controller.Bids

instance Job BidJob where
    perform BidJob { .. } = do
        bid <- fetch bidId


        item <- fetch (get #itemId bid)
                >>= fetchRelated #bids

        bid
            |> validateIsPriceAboveOtherBids item
            |> ifValid \case
            Left bid -> do
                let errors = bid
                        |> get #meta
                        |> get #annotations

                let status =
                        case errors of
                            ((_, "Price too low"): _) -> RejectedLowPrice
                            _ -> Rejected


                bid
                    |>set #status status
                    |> updateRecord

                -- Trigger pre-registered bids.
                triggerPreRegisteredBid bid


            Right bid -> do
                bid
                    |>set #status Accepted
                    |> updateRecord

                pure ()

        pure ()




    maxAttempts = 1


validateIsPriceAboveOtherBids :: Include "bids" Item -> Bid -> Bid
validateIsPriceAboveOtherBids item bid = do
    let bids = get #bids item

    case getWinningBid bids of
        Nothing ->
            -- No winning bid, so validate above 0.
            bid
                |> validateField #price (isGreaterThan 0)
        Just winningBid ->
            -- Make sure we don't validate against self Bid.
            if get #id winningBid == get #id bid
                then bid
                else bid |> validateField #price (isGreaterThan price |> withCustomErrorMessage "Price too low")
                    where
                        price = get #price winningBid


triggerPreRegisteredBid :: (?modelContext::ModelContext) => Bid -> IO ()
triggerPreRegisteredBid bid = do
    pure ()
    -- item <- fetch (get #itemId bid)
    -- itemBids <- fetch (get #bids item)
    -- mMailBid <- case getWinningBid itemBids of
    --     Nothing -> pure Nothing
    --     Just winningBid ->
    --         if get #bidType winningBid == Internet || get #price winningBid < 500
    --             then do
    --                 -- threadDelay (2 * 1000000)

    --                 mailBid <- newRecord @Bid
    --                         |> set #itemId (get #itemId bid)
    --                         -- Internet bid type by default.
    --                         |> set #bidType AutoMail
    --                         |> set #price (get #price winningBid + 10)
    --                         |> createRecord


    --                 triggerPreRegisteredBid mailBid

    --                 Just mailBid |> pure
    --             else
    --                 pure Nothing

    -- pure ()