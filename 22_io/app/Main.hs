module Main where

-- 文字列の単語を逆順に表示
-- "hey there man" -> "yeh ereht man"
reverseWords :: String -> String
reverseWords = unwords . map reverse . words

main :: IO ()
main = do
    line <- getLine -- 入力を受け取る
    if null line
        then return () -- なにもしないI/Oアクションを作成
        else do
            putStrLn $ reverseWords line
            main -- 再帰
