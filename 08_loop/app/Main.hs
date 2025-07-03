module Main where

loop :: Int -> IO () -> IO ()
loop 0 action = return ()
loop n action = do
    action
    loop (n - 1) action

main :: IO ()
main = loop 10 $ putStrLn "Hello"
