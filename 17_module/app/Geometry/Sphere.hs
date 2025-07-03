-- 球
module Geometry.Sphere (
    volume,
    area,
) where

-- 体積
volume :: Float -> Float
volume radius = (4.0 / 3.0) * pi * (radius ^ 3)

-- 面積
area :: Float -> Float
area radius = 4 * pi * (radius ^ 2)
