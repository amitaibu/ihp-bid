module Application.Helper.Controller where

import IHP.ControllerPrelude

-- Here you can add functions which are available in all your controllers
getWinningBid item = do
    bids <- fetch (get #bids item)
    let highestBid =
            case bids of
                [] -> Nothing
                xs -> foldr (\bid accum ->
                    case accum of
                        Nothing ->
                            Just bid
                        Just highestBid ->
                            if get #price bid > get #price highestBid then
                                Just bid
                            else
                                Just highestBid
                    ) Nothing xs


    pure highestBid