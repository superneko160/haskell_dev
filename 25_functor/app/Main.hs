module Main where

import GHC.IO.Encoding (setLocaleEncoding, utf8)

addOne :: Int -> Int
addOne x = x + 1

-- 1. Maybe型でのfmpa利用例
-- MaybeはJust value または Nothing を表現する型
maybeExamples :: IO ()
maybeExamples = do
    putStrLn "\n=== Maybe型でのfmap利用例 ==="
    print (fmap addOne (Just 5)) -- Just 6
    print (fmap addOne (Nothing)) -- Nothing

-- 2. リスト型でのfmap利用例
-- リストもFunctorのインスタンス
listExamples :: IO ()
listExamples = do
    putStrLn "\n=== リスト型でのfmap利用例 ==="
    print (fmap addOne [1, 2, 3])

-- 3. 独自のFunctor
-- 単純な「箱」を表現するデータ型
data Box a = Empty | Full a deriving (Show, Eq)

-- BoxをFunctorのインスタンスにする
instance Functor Box where
    fmap _ Empty = Empty -- 空の箱にはなにもしない
    fmap f (Full x) = Full (f x) -- 中身がある場合には関数を適用

-- 独自のFunctorの利用例
boxExamples :: IO ()
boxExamples = do
    putStrLn "\n=== 独自で定義したBox型でのfmap利用例 ==="
    print (fmap addOne (Full 42)) -- Full 43
    print (fmap addOne Empty) -- Empty
    print (fmap length (Full "test")) -- Full 4

main :: IO ()
main = do
    setLocaleEncoding utf8
    maybeExamples
    listExamples
    boxExamples
