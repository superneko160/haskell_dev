module Main where

{-
 - 関数を受け取り、それを２回適用する関数
 - (a -> a) 引数aを受け取り、返り値aを返す関数という意味
 -}
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

main :: IO ()
main = do
    print (applyTwice (+ 3) 10) -- 16  +3が2回適用されて+6
    print (applyTwice (++ " HAHA") "HEY") -- HEY HAHA HAHA
    print (applyTwice ("HAHA " ++) "HEY") -- HAHA HAHA HEY
    print (applyTwice (multThree 2 2) 9) -- 4 * g を2回適用するので、4 * 9 = 36, 4 * 36 = 144
    print (applyTwice (3 :) [2]) -- (:3) 3を先頭に追加 [2] 2だけが入ったリスト  [3, 3, 2]
