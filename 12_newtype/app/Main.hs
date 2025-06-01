module Main where

newtype Meter = Meter Double deriving Show
newtype Kilogram = Kilogram Double deriving Show

addMeters :: Meter -> Meter -> Meter
addMeters (Meter m1) (Meter m2) = Meter (m1 + m2)

main :: IO ()
main = do
    let meter1 = Meter 10.0
    let meter2 = Meter 2.1
    print $ addMeters meter1 meter2
    
    -- compile error!
    -- let kilogram = Kilogram 3.2
    -- print $ addMeters meter1 Kilogram

