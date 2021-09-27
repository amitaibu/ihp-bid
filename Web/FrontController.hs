module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Bids
import Web.Controller.Items
import Web.Controller.Static

instance FrontController WebApplication where
    controllers =
        [ startPage ItemsAction
        -- Generator Marker
        , parseRoute @BidsController
        , parseRoute @ItemsController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
