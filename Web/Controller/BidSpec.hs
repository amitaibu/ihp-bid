module Web.Controller.BidSpec where

import Network.HTTP.Types.Status (status200)

import IHP.FrameworkConfig (ConfigBuilder (..))
import IHP.Prelude
import IHP.QueryBuilder (query)
import IHP.Test.Mocking
import Test.Hspec

import Generated.Types
import Main ()
import Web.Routes
import Web.Types

spec :: Spec
spec = beforeAll (makeConfig >>= mockContext WebApplication) do
    describe "User controller" $ do
        it "has no existing users" $ withContext do
            users <- query @User |> fetch
            users `shouldBe` []

        it "responds with some content" $ withContext do
            content <- mockActionResponse NewUserAction
            content `shouldBe` "<!DOCTYPE HTML>...</html>"

        it "creates a new user" $ withParams [("a-test-param", "some-value")] do
            mockActionStatus CreateUserAction `shouldReturn` status200

        it "returns a redirect header" $ withContext do
            hs <- headers (mockAction NewUserAction)
            lookup "Location" hs `shouldNotBe` Nothing