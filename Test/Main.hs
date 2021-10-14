module Main where

import Test.Hspec
import IHP.Prelude

import Test.Controller.BidSpec

main :: IO ()
main = hspec do
    Test.Controller.BidSpec.tests