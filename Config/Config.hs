module Config where

import IHP.Prelude
import IHP.Environment
import IHP.FrameworkConfig
import Data.Fixed ( Pico )


newtype BidPreventItemSwitchToInactiveRecentBidDiffSeconds = BidPreventItemSwitchToInactiveRecentBidDiffSeconds Data.Fixed.Pico

config :: ConfigBuilder
config = do
    option Development
    option (AppHostname "localhost")
    option (BidPreventItemSwitchToInactiveRecentBidDiffSeconds 5)