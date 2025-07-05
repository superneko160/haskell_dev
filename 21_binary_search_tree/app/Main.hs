module Main where

import Data.BinarySearchTree

main :: IO ()
main = do
    -- print numsTree
    print (8 `treeElem` numsTree) -- True
    print (100 `treeElem` numsTree) -- False
    print (1 `treeElem` numsTree) -- True
    print (10 `treeElem` numsTree) -- False
  where
    nums = [8, 6, 4, 1, 7, 3, 5]
    numsTree = buildTree nums
