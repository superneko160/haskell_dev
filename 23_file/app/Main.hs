module Main where

import System.IO

main :: IO ()
main = do

    -- 1. openFile関数：ファイルパスとモードの2つの引数をとる
    -- handle <- openFile "baabaa.txt" ReadMode
    -- 2. hGetContents関数：渡されたハンドルからファイルの内容を読み込む
    -- 一度にメモリに読み込むことはせず、必要になったとき必要なぶんだけ読み込む
    -- contents <- hGetContents handle
    -- 3. 出力
    -- putStr contents
    -- 4. ファイルクローズ
    -- hClose handle

    -- withFile関数：ハンドルを確実に閉じてくれる
    withFile "baabaa.txt" ReadMode $ \handle -> do
        contents <- hGetContents handle
        putStr contents

