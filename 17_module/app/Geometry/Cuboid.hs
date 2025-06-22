-- 直方体
module Geometry.Cuboid
(
    volume,
    area
) where

-- 面積
area :: Float -> Float -> Float -> Float
area a b c = rectArea a b * 2 + rectArea a c * 2 + rectArea c b * 2

-- 体積
volume :: Float -> Float -> Float -> Float
volume a b c = rectArea a b * c

-- 四角形の面積（private）
rectArea :: Float -> Float -> Float
rectArea a b = a * b

