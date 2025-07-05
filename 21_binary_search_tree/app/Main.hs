module Main where

-- 木構造
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

-- 要素が1つのみの木を作成
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

-- 要素xを木に挿入する
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a = Node a (treeInsert x left) right
    | x > a = Node a left (treeInsert x right)

-- 要素xが木に属しているか判定する
treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right

main :: IO ()
main = do
        -- print numsTree
        print (8 `treeElem` numsTree)   -- True
        print (100 `treeElem` numsTree) -- False
        print (1 `treeElem` numsTree)   -- True
        print (10 `treeElem` numsTree)  -- False
    where
        numsTree = foldr treeInsert EmptyTree nums
        nums = [8,6,4,1,7,3,5]

