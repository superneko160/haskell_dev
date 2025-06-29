module Main where

import qualified Data.Map as Map

-- ロッカーの状態
-- Taken: 使用中
-- Free:  空き状態
data LockerState = Taken | Free deriving (Show, Eq)

-- ロッカーの暗証番号
type Code = String

-- ロッカーの型
type LockerMap = Map.Map Int (LockerState, Code)

-- ロッカー
lockers :: LockerMap
lockers = Map.fromList
    [
        (100, (Taken, "ZD39I")),
        (101, (Free, "QD29R")),
        (102, (Free, "EX99Z")),
        (103, (Taken, "TD30I")),
        (104, (Taken, "HD34I"))
    ]

-- ロッカーのリストから暗証番号を検索する
--
-- @param Int lockerNumber ロッカー番号
-- @param LockerMap list ロッカー
-- @return Either String Code
--
-- Either型を利用する理由
-- この関数が失敗するパターンが2通りあるため
-- 1. ロッカーがすでに使用されている場合（ロッカーを誰かが使っている場合、暗証番号を伝えるわけにはいかない）
-- 2. ロッカーが存在しない場合
--
lockerLookUp :: Int -> LockerMap -> Either String Code
lockerLookUp lockerNumber list = case Map.lookup lockerNumber list of
    Nothing -> Left $ "Locker " ++ show lockerNumber ++ " doesn't exist!"
    Just(state, code) -> if state /= Taken
                        then Right code
                        else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

main :: IO ()
main = do
    print (lockerLookUp 101 lockers)  -- 使用中
    print (lockerLookUp 102 lockers)  -- 使用中
    print (lockerLookUp 103 lockers)  -- 空き
    print (lockerLookUp 104 lockers)  -- 空き
    print (lockerLookUp 105 lockers)  -- 存在しない

