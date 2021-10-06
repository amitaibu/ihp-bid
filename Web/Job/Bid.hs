module Web.Job.Bid where
import Web.Controller.Prelude

instance Job BidJob where
    perform BidJob { .. } = do
        putStrLn "Hello World!"
