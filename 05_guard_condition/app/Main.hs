module Main where

{-
functionName arg1, arg2, ...
    | condition1 = expr1
    | condition2 = expr2
    | otherwise = expr3
-}

fizzBuzz :: Int -> String
fizzBuzz number
    | number `mod` 3 == 0 && number `mod` 5 == 0 = "FizzBuzz"
    | number `mod` 3 == 0 = "Fizz"
    | number `mod` 5 == 0 = "Buzz"
    | otherwise = show number

main :: IO ()
main = do
    print (fizzBuzz 2)
    print (fizzBuzz 3)
    print (fizzBuzz 5)
    print (fizzBuzz 15)
