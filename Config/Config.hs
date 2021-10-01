module Config where

import IHP.Prelude
import IHP.Environment
import IHP.FrameworkConfig
import Data.Fixed ( Pico )


{-| If a Bid was sumibtted, the time in seconds
    to wait before allowing to switch an Item from Active to Inactive.
-}
newtype BidPreventItemSwitchToInactiveRecentBidDiffSeconds = BidPreventItemSwitchToInactiveRecentBidDiffSeconds Data.Fixed.Pico

config :: ConfigBuilder
config = do
    option Development
    option (AppHostname "localhost")
    option (BidPreventItemSwitchToInactiveRecentBidDiffSeconds 5)