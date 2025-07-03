module Geometry.CuboidSpec (spec) where

import qualified Geometry.Cuboid as Cuboid
import Test.Hspec

spec :: Spec
spec = do
    describe "Volume Calculation" $ do
        it "correctly calculates volume of unit cuboid (1x1x1)" $ do
            Cuboid.volume 1.0 1.0 1.0 `shouldBe` 1.0

        it "correctly calculates volume of cuboid (2x3x4)" $ do
            Cuboid.volume 2.0 3.0 4.0 `shouldBe` 24.0

        it "correctly calculates volume of cuboid (1x2x3)" $ do
            Cuboid.volume 1.0 2.0 3.0 `shouldBe` 6.0

        it "correctly calculates volume of cuboid (0.5x2x4)" $ do
            Cuboid.volume 0.5 2.0 4.0 `shouldBe` 4.0

        it "returns volume 0 when any dimension is 0" $ do
            Cuboid.volume 0.0 5.0 3.0 `shouldBe` 0.0
            Cuboid.volume 2.0 0.0 4.0 `shouldBe` 0.0
            Cuboid.volume 3.0 2.0 0.0 `shouldBe` 0.0

    describe "Surface Area Calculation" $ do
        it "correctly calculates surface area of unit cuboid (1x1x1)" $ do
            Cuboid.area 1.0 1.0 1.0 `shouldBe` 6.0

        it "correctly calculates surface area of cuboid (2x3x4)" $ do
            -- 2*(2*3) + 2*(2*4) + 2*(3*4) = 2*6 + 2*8 + 2*12 = 12 + 16 + 24 = 52
            Cuboid.area 2.0 3.0 4.0 `shouldBe` 52.0

        it "correctly calculates surface area of cuboid (1x2x3)" $ do
            -- 2*(1*2) + 2*(1*3) + 2*(2*3) = 2*2 + 2*3 + 2*6 = 4 + 6 + 12 = 22
            Cuboid.area 1.0 2.0 3.0 `shouldBe` 22.0

        it "correctly calculates surface area of flat cuboid (5x3x1)" $ do
            -- 2*(5*3) + 2*(5*1) + 2*(3*1) = 2*15 + 2*5 + 2*3 = 30 + 10 + 6 = 46
            Cuboid.area 5.0 3.0 1.0 `shouldBe` 46.0

        it "calculates surface area when one dimension is 0 (degenerate case)" $ do
            -- 0x5x3の直方体は実質的に5x3の長方形2枚 = 2*15 = 30
            Cuboid.area 0.0 5.0 3.0 `shouldBe` 30.0
            -- 2x0x4の直方体は実質的に2x4の長方形2枚 = 2*8 = 16
            Cuboid.area 2.0 0.0 4.0 `shouldBe` 16.0
            -- 3x2x0の直方体は実質的に3x2の長方形2枚 = 2*6 = 12
            Cuboid.area 3.0 2.0 0.0 `shouldBe` 12.0

        it "handles square-based cuboid correctly" $ do
            -- 正方形ベースの直方体: 3x3x5
            -- 2*(3*3) + 2*(3*5) + 2*(3*5) = 2*9 + 2*15 + 2*15 = 18 + 30 + 30 = 78
            Cuboid.area 3.0 3.0 5.0 `shouldBe` 78.0
