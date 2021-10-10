module Config where

import IHP.Environment
import IHP.FrameworkConfig
import IHP.Mail
import IHP.Prelude

config :: ConfigBuilder
config = do
    option Development
    option
        (AppHostname "localhost")
    option $
        SMTP
            { host = "127.0.1.1"
            , port = 1025
            , credentials = Nothing -- or Just ("myusername","hunter2")
            }
