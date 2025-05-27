module Main where

{-
functionName arg1, arg2, ...
    | condition1 = expr1
    | condition2 = expr2
    | otherwise = expr3
-}

foo :: Int -> String
foo x
    | x == 1 = "One"
    | x == 2 = "Two"
    | otherwise = "More..."

main :: IO ()
main = do
    print (foo 1)
    print (foo 2)
    print (foo 3)

