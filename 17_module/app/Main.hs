module Main where

import qualified Geometry.Cube as Cube
import qualified Geometry.Cuboid as Cuboid
import qualified Geometry.Sphere as Sphere

main :: IO ()
main = do
    print (Sphere.area 4.0) -- 201.06
    print (Sphere.volume 4.0) -- 268.08
    print (Cuboid.area 2.0 3.0 4.0) -- 52
    print (Cuboid.volume 2.0 3.0 4.0) -- 24
    print (Cube.area 3.0) -- 54
    print (Cube.volume 3.0) -- 27
