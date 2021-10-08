module Web.Routes where

import Generated.Types
import IHP.RouterPrelude
import Web.Types

-- Generator Marker
instance AutoRoute StaticController
instance AutoRoute ItemsController

instance AutoRoute BidsController
instance AutoRoute SessionsController
instance AutoRoute UsersController
