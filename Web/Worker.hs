module Web.Worker where

import IHP.Prelude
import Web.Types
import Generated.Types
import IHP.Job.Runner
import IHP.Job.Types

import Web.Job.Bid

instance Worker WebApplication where
    workers _ =
        [ worker @BidJob
        -- Generator Marker
        ]
