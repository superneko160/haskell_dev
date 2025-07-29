module Main where

import GHC.IO.Encoding (setLocaleEncoding, utf8)

-- 2つのMaybeな整数を加算
addTwoNumbers :: Int -> Int -> Int
addTwoNumbers x y = x + y

-- Maybeな値を使って加算する例
exampleMaybeAdd :: Maybe Int
exampleMaybeAdd = pure addTwoNumbers <*> Just 5 <*> Just 10

-- Maybeな値で片方がNothingの場合の例
exampleMaybeAddNothing :: Maybe Int
exampleMaybeAddNothing = pure addTwoNumbers <*> Just 5 <*> Nothing

-- Maybeな値で両方がNothingの場合の例
exampleMaybeAddBothNothing :: Maybe Int
exampleMaybeAddBothNothing = pure addTwoNumbers <*> Nothing <*> Nothing

-- 2つのリストの要素をすべて足し合わせる例
exampleListCombinations :: [Int]
exampleListCombinations = pure addTwoNumbers <*> [1, 2] <*> [10, 20]

main :: IO ()
main = do
    setLocaleEncoding utf8
    putStrLn "--- Maybeの例 ---"
    putStrLn $ "Just 5 とJust 10 を加算: " ++ show exampleMaybeAdd
    putStrLn $ "Just 5 とNothing を加算: " ++ show exampleMaybeAddNothing
    putStrLn $ "Nothing とNothing を加算: " ++ show exampleMaybeAddBothNothing
    putStrLn ""
    putStrLn "--- リストの例 ---"
    putStrLn $ "２つリストの要素をすべて足す組み合わせ: " ++ show exampleListCombinations
