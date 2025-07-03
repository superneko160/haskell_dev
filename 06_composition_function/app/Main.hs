module Main where

f :: Int -> Int
f n = n * 2

g :: Int -> Int
g n = n * 3

h :: Int -> Int
h n = n * 4

compositionFunc :: Int -> Int
compositionFunc = f . g . h -- f(g(h(n)))

main :: IO ()
main = print $ compositionFunc 5
