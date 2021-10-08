module Web.Job.Bid where

import Control.Concurrent (threadDelay)
import Web.Controller.Bids
import Web.Controller.Prelude

instance Job BidJob where
    perform BidJob{..} = do
        bid <- fetch bidId

        item <-
            fetch (get #itemId bid)
                >>= fetchRelated #bids

        bid
            |> validateIsPriceAboveOtherBids item
            |> ifValid \case
                Left bid -> do
                    let errors =
                            bid
                                |> get #meta
                                |> get #annotations

                    let status =
                            case errors of
                                ((_, "Price too low") : _) -> RejectedLowPrice
                                _ -> Rejected

                    bid
                        |> set #status status
                        |> updateRecord

                    pure ()
                Right bid -> do
                    bid
                        |> set #status Accepted
                        |> updateRecord

                    case get #bidType bid of
                        Mail -> pure ()
                        -- Trigger pre-registered bids.
                        _ -> triggerPreRegisteredBid bid

        pure ()

    maxAttempts = 1

    -- Max 3 seconds to process each Bid.
    timeoutInMicroseconds = Just $ 1000000 * 3

triggerPreRegisteredBid :: (?modelContext :: ModelContext) => Bid -> IO ()
triggerPreRegisteredBid bid = do
    item <-
        fetch (get #itemId bid)
            >>= fetchRelated #bids

    case getWinningBid item of
        Nothing -> pure ()
        Just winningBid ->
            if get #bidType winningBid == Internet || get #price winningBid < 500
                then do
                    threadDelay (1 * 1000000)

                    triggeredBid <-
                        newRecord @Bid
                            |> set #itemId (get #itemId bid)
                            -- Internet bid type by default.
                            |> set #bidType AutoMail
                            -- Bump the price.
                            |> set #price (get #price winningBid + 10)
                            -- Bid is initially queued.
                            |> set #status Queued
                            |> createRecord

                    -- Create a Job for the Bid to be processed.
                    newRecord @BidJob
                        |> set #bidId (get #id triggeredBid)
                        |> create

                    pure ()
                else pure ()
