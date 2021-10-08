module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Bids
import Web.Controller.Items
import IHP.LoginSupport.Middleware
import Web.Controller.Sessions
import Web.Controller.Users
import IHP.Job.Dashboard

instance FrontController WebApplication where
    controllers =
        [ startPage ItemsAction
        , parseRoute @SessionsController
        , parseRoute @MyJobDashboard
        -- Generator Marker
        , parseRoute @BidsController
        , parseRoute @ItemsController
        , parseRoute @UsersController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @User


type MyJobDashboard = JobsDashboardController
    NoAuth '[]