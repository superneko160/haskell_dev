module Main where

{-
 - ベクトル：空間中の矢印
 - Vector 3 4 5は三次元空間の座標(0,0,0)を始点とし、(3,4,5)を終点とする線分
 -}
data Vector a = Vector a a a deriving (Show)

-- 2つのベクトルの加算する
vplus :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vplus` (Vector l m n) = Vector (i + l) (j + m) (k + n)

-- 2つのベクトルの内積を取得
dotProd :: (Num a) => Vector a -> Vector a -> a
(Vector i j k) `dotProd` (Vector l m n) = i * l + j * m + k * n

-- ベクトルをスカラー倍する
vmult :: (Num a) => Vector a -> a -> Vector a
(Vector i j k) `vmult` m = Vector (i * m) (j * m) (k * m)

main :: IO ()
main = do
    print (Vector 3 5 8 `vplus` Vector 9 2 8)
    print (Vector 3 5 8 `vplus` Vector 9 2 8 `vplus` Vector 0 2 3)
    print (Vector 3 9 7 `vmult` 10)
    print (Vector 4 9 5 `dotProd` Vector 9.0 2.0 4.0)
    print (Vector 2 9 3 `vmult` (Vector 4 9 5 `dotProd` Vector 9 2 4))
