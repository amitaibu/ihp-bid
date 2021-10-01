module Config where

import IHP.Prelude
import IHP.Environment
import IHP.FrameworkConfig


newtype BidPreventItemSwitchToInactiveRecentBidDiffSeconds = BidPreventItemSwitchToInactiveRecentBidDiffSeconds Int

config :: ConfigBuilder
config = do
    option Development
    option (AppHostname "localhost")
    option (BidPreventItemSwitchToInactiveRecentBidDiffSeconds 20)