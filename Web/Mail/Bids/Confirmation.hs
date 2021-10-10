module Web.Mail.Bids.Confirmation where

import IHP.MailPrelude
import Web.View.Prelude

data ConfirmationMail = ConfirmationMail {bid :: Bid}

instance BuildMail ConfirmationMail where
    subject = "Subject"
    to ConfirmationMail{..} = Address{addressName = Just "Firstname Lastname", addressEmail = "amitaibu@gmail.com"}
    from = "hi@example.com"
    html ConfirmationMail{..} =
        [hsx|
        Hi, Bid {get #id bid} has price {get #price bid}, and status {get #status bid}
    |]
