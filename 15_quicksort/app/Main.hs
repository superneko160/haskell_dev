module Main where

import Data.Char (isSpace)

-- ソート対象
numbers :: [Int]
numbers = [10, 2, 5, 3, 1, 6, 7, 4, 2, 3, 4, 9, 8]

text :: String
text = "the quick brown fox jumps over the lazy dog"

{-
 - 文字列から空白を除去
 - 空白でない場合、文字をそのまま返す
 - inSpace: 空白の場合trueを返す
 - not: 反転
 - filter: trueの要素だけを抽出する
 -}
removeSpaces :: String -> String
removeSpaces s = filter (not . isSpace) s

{-
 - クイックソート：ピボット（軸となる要素）を指定して
 - それより小さい要素のリストを左に、大きい要素が入ったリストを右に配置することを繰り返して
 - ソートする方法
 - ここではピボットを、リストの先頭要素としている
 - （所要時間を短縮するにはピボットをランダムに選ぶなどの工夫がi必要）
 -}
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =                              -- リストの先頭要素をピボットとする
    let smallerOrEqual = [a | a <- xs, a <= x]  -- ピボットより小さい要素のリスト作成
        larger = [a | a <- xs, a > x]           -- ピボットより大きい要素のリスト作成
    in quicksort smallerOrEqual ++ [x] ++ quicksort larger

main :: IO ()
main = do
    print (quicksort numbers)
    print (quicksort (removeSpaces text))

