-- 立方体
module Geometry.Cube
(
    volume,
    area
) where

import qualified Geometry.Cuboid as Cuboid

-- 面積
area :: Float -> Float
area side = Cuboid.area side side side

-- 体積
volume :: Float -> Float
volume side = Cuboid.volume side side side

