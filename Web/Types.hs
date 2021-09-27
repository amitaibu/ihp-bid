module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types
import IHP.LoginSupport.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data ItemsController
    = ItemsAction
    | NewItemAction
    | ShowItemAction { itemId :: !(Id Item) }
    | CreateItemAction
    | EditItemAction { itemId :: !(Id Item) }
    | UpdateItemAction { itemId :: !(Id Item) }
    | DeleteItemAction { itemId :: !(Id Item) }
    deriving (Eq, Show, Data)

data BidsController
    = BidsAction
    | NewBidAction { itemId :: !(Id Item) }
    | ShowBidAction { bidId :: !(Id Bid) }
    | CreateBidAction
    | EditBidAction { bidId :: !(Id Bid) }
    | UpdateBidAction { bidId :: !(Id Bid) }
    | DeleteBidAction { bidId :: !(Id Bid) }
    deriving (Eq, Show, Data)

data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)

instance HasNewSessionUrl User where
    newSessionUrl _ = "/NewSession"

type instance CurrentUserRecord = User