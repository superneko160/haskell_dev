module Main where

-- レコード構文 
data Person = Person {
    firstName :: String,
    lastName :: String,
    age :: Int,
    height :: Float,
    phoneNumber :: String,
    flavor :: String
} deriving (Show)

main :: IO ()
main = do
    -- カンマ（,）区切りでないことに注意
    let jhon = Person "Jhon" "Doe" 32 173.5 "999-9999" "Chocolate"
    print (firstName jhon)
    print (lastName jhon)
    print (age jhon)
    print (height jhon)
    print (flavor jhon)

