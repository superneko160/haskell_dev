module Main where

data Figure = Rect {x1, y1, x2, y2 :: Int} | Circle {x, y, r :: Int} deriving (Show)

area :: Figure -> Double
area (Rect x1 y1 x2 y2) = fromIntegral ((x2 - x1) * (y2 - y1))
area (Circle x y r) = (fromIntegral (r) * fromIntegral (r) * 3.14)

main :: IO ()
main = do
    let a = Rect{x1 = 100, y1 = 100, x2 = 200, y2 = 200}
        b = Circle{x = 100, y = 100, r = 50}
    print $ area a
    print $ area b
