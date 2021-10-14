module Test.Controller.BidSpec where

import Network.HTTP.Types.Status (status200)

import IHP.Prelude
import IHP.QueryBuilder (query)
import IHP.Test.Mocking
import IHP.Fetch

import IHP.FrameworkConfig
import IHP.HaskellSupport
import Test.Hspec
import Config

import Generated.Types
import Web.Routes
import Web.Types

spec :: Spec
spec = beforeAll (mockContext WebApplication config) do
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