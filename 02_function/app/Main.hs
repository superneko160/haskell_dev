module Main where

add :: Int -> Int -> Int
add x y = x + y

main :: IO ()
main = print (add 3 5) -- 8
