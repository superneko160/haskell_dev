module Main where

{-
 - Haskellのifは式であり、文ではない
 - つまり、Hakellのifは値を返す
 - （下だとZeroかNotZeroを返す）
 -
 - また、ifは式なのでthenとelseで返す値は同じ型でなくてはならない
 - （下だとZeroもNotZeroもString）
 -}
isZero :: Int -> String
isZero x =
    if x == 0
        then
            "Zero"
        else
            "NotZero"

main :: IO ()
main = putStrLn $ isZero 0
