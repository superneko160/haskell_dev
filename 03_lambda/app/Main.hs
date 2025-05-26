module Main where

{-
    \arg -> expr
    \(arg1, arg2) -> expr
-}

main :: IO ()
main =  print c  -- 31
    where
        c = a + b  -- 31 ( 25 + 6)
        a = (\x -> x * x) 5  -- 25 (5 * 5)
        b = (\(x, y) -> x * y) (2, 3)  -- 6 (2 * 3)

