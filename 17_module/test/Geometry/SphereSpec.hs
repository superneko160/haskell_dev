module Geometry.SphereSpec (spec) where

import qualified Geometry.Sphere as Sphere
import Test.Hspec

spec :: Spec
spec = do
    describe "Volume Calculation" $ do
        it "correctly calculates volume of sphere with radius 1" $ do
            Sphere.volume 1.0 `shouldBe` (4.0 / 3.0 * pi)

        it "correctly calculates volume of sphere with radius 2" $ do
            Sphere.volume 2.0 `shouldBe` (4.0 / 3.0 * pi * 8.0)

        it "correctly calculates volume of sphere with radius 3 (with tolerance)" $ do
            let expected = (4.0 / 3.0) * pi * 27.0
            Sphere.volume 3.0 `shouldSatisfy` (\x -> abs (x - expected) < 0.001)

        it "returns volume 0 when radius is 0" $ do
            Sphere.volume 0.0 `shouldBe` 0.0

    describe "Surface Area Calculation" $ do
        it "correctly calculates surface area of sphere with radius 1" $ do
            Sphere.area 1.0 `shouldBe` (4.0 * pi)

        it "correctly calculates surface area of sphere with radius 2" $ do
            Sphere.area 2.0 `shouldBe` (4.0 * pi * 4.0)

        it "correctly calculates surface area of sphere with radius 3 (with tolerance)" $ do
            let expected = 4.0 * pi * 9.0
            Sphere.area 3.0 `shouldSatisfy` (\x -> abs (x - expected) < 0.001)

        it "returns surface area 0 when radius is 0" $ do
            Sphere.area 0.0 `shouldBe` 0.0
