module Geometry.CubeSpec (spec) where

import Test.Hspec
import qualified Geometry.Cube as Cube

spec :: Spec
spec = do
    describe "Volume Calculation" $ do
        it "correctly calculates volume of cube with side 1" $ do
            Cube.volume 1.0 `shouldBe` 1.0
      
        it "correctly calculates volume of cube with side 2" $ do
            Cube.volume 2.0 `shouldBe` 8.0
      
        it "correctly calculates volume of cube with side 3" $ do
            Cube.volume 3.0 `shouldBe` 27.0
      
        it "correctly calculates volume of cube with side 0.5" $ do
            Cube.volume 0.5 `shouldBe` 0.125
      
        it "returns volume 0 when side is 0" $ do
            Cube.volume 0.0 `shouldBe` 0.0

    describe "Surface Area Calculation" $ do
        it "correctly calculates surface area of cube with side 1" $ do
            Cube.area 1.0 `shouldBe` 6.0
      
        it "correctly calculates surface area of cube with side 2" $ do
            Cube.area 2.0 `shouldBe` 24.0
      
        it "correctly calculates surface area of cube with side 3" $ do
            Cube.area 3.0 `shouldBe` 54.0
      
        it "correctly calculates surface area of cube with side 0.5" $ do
            Cube.area 0.5 `shouldBe` 1.5
      
        it "returns surface area 0 when side is 0" $ do
            Cube.area 0.0 `shouldBe` 0.0

