module Main where

numbers :: [Int]
numbers = [2, 4, 11, 7, 3]

{-
 - maximum関数はデフォルトで存在するので、アポストロフィを付与
 - (Ord a)は型クラス
 - 型aはOrd型クラスのインスタンスでなければならないという制約を与えている
 - (Eq a, Show a) => ...のように複数記述可能
 - ()で括り、=>(->ではない)で指定する
 -}
maximum' :: (Ord a) => [a] -> a
-- 空のリストの場合
maximum' [] = error "maximum of empty list!"
-- 1つしか要素がない場合
maximum' [x] = x
{-
 - (x:xs)
 - x リストの先頭要素
 - xs リストの残り部分（リスト）
 -}
maximum' (x:xs) = max x (maximum' xs)

main :: IO ()
main = do
    print (maximum' numbers)

