module Main where

isZero :: Int -> String
isZero x =
    if x == 0 then
        "Zero"
    else
        "NotZero"

main :: IO ()
main = putStrLn $ isZero 0

