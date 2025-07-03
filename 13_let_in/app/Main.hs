module Main where

{-
    let bindings in expression
-}

-- 円柱の面積を求める
cylinder :: Double -> Double -> Double
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
     in sideArea + 2 * topArea

main :: IO ()
main = print (cylinder 2.4 15.2)
