# 二分探索木

二分探索木は、1つの要素が2つの要素へのポインタを持つ  
一方は左の子で、もう一方は右の子  
左の子は親より小さく、右の子は親より大きいようにしておく  
それぞれの子要素はさらに2つ（あるいは1つ、あるいは0個）の要素を持つ。結果として、各要素は2つ以下の部分木を持つ

## 補足

### flodr関数

リストの右端から演算（関数）を適用していく。PHPの`array_reduce`に近い

- 第1引数：関数
- 第2引数：初期値（アキュムレータ）
- 第3引数：リスト

```hs
-- リストの要素の合計値を求める
-- リストxsの要素に+関数を適用していく
sum' :: Num a => [a] -> a
sum' xs = foldr (+) 0 xs
```

```hs
-- 実行例
sum' [1, 2, 3, 4]  -- 10
```

サンプルコード上のbuildTree関数で引数のリストを取っていないのは、部分適用とカリー化の仕組みによるもの。一般的にHaskellでは、引数を明示しないポイントスタイルが好まれる

```hs
-- リストから木を構築する
buildTree :: (Ord a) => [a] -> Tree a
buildTree = foldr treeInsert EmptyTree
```

### データ型をエクスポート

以下のデータ型をエクスポートしたい場合、いくつか方法がある

```hs
-- 型名 = コンストラクタ | コンストラクタ
data Tree a = EmptyTree | Node a (Tree a) (Tree a)
```

```hs
-- 1. 型のみエクスポート（コンストラクタは隠蔽）
module DataBinarySearchTree
    ( Tree
    , treeInsert
    -- ...
    ) where

-- 2. 特定のコンストラクタのみエクスポート
module DataBinarySearchTree
    ( Tree(EmptyTree)  -- EmptyTreeのみ公開
    , treeInsert
    -- ...
    ) where

module DataBinarySearchTree
    ( Tree(EmptyTree, Node)  -- EmptyTreeとNode公開
    , treeInsert
    -- ...
    ) where

-- すべてのコンストラクタをエクスポート
module DataBinarySearchTree
    ( Tree(..)
    , treeInsert
    -- ...
    ) where
```

