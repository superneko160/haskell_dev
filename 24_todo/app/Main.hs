module Main where

import System.Environment
import System.Directory
import System.IO
import Data.List
import Control.Exception

main = do
    -- コマンドライン引数を取得、最初の引数をcommandに、残りをargListに束縛
    (command:argList) <- getArgs
    -- dispatch関数にcommandを渡すと、add、view、removeのいずれかが返る
    dispatch command argList

-- 最初のコマンドライン引数で処理を割り振り
dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove
dispatch command = doesntExist command

-- TODOリストに追加
add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

-- TODOリストを表示
view :: [String] -> IO ()
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStr $ unlines numberedTasks

-- TODOリストから削除
remove :: [String] -> IO ()
remove [fileName, numberString] = do
    contents <- readFile fileName

    let todoTasks = lines contents
        number = read numberString
        newTodoItems = unlines $ delete (todoTasks !! number) todoTasks

    bracketOnError (openTempFile "." "temp")
        (\(tempName, tempHandle) -> do
            hClose tempHandle
            removeFile tempName)

        (\(tempName, tempHandle) -> do
            hPutStr tempHandle newTodoItems
            hClose tempHandle
            removeFile fileName
            renameFile tempName fileName)

-- 存在しないコマンドが入力された場合、その旨のメッセージ表示
doesntExist command _ =
    putStrLn $ "The " ++ command ++ " command doesn't exist"

