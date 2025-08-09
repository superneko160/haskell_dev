module Main where

-- モナド
-- 計算の文脈や副作用を抽象化する
-- 実用的な理解を優先するならば、計算を連鎖させる仕組み
-- >>=（bind演算子）:モナドの値を取り出し関数に渡し、新しいモナドを返す

-- Maybe Monad
safeDivide :: Double -> Double -> Maybe Double
safeDivide _ 0 = Nothing
safeDivide x y = Just (x / y)

main :: IO ()
main = do
    -- 10を2で割り、その結果を3で割る
    let result1 = Just 10 >>= (`safeDivide` 2) >>= (`safeDivide` 3)
    -- モナドの利点は、途中でNothingが発生すると、以降の計算がスキップされる点
    let result2 = Just 10 >>= (`safeDivide` 0) >>= (`safeDivide` 3)
    print result1 -- Just 1.666...
    print result2 -- Nothing

