module Main where

-- Show, Read, Eq, Ord
data TDDStatus = Red | Green | Refactoring deriving (Show, Eq)

main :: IO ()
main = do
    let step1 = Red
    let step2 = Green
    if step1 == step2 then print "Equal!!" else print "Not Equal"

