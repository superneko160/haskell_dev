# モジュール

## 基本構文

```hs
import moduleName
```

以下は`Data.List`をインポートして`nub`関数を利用している例

```hs
import Data.List

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub
```

特定の関数のみをインポートしたい場合の例

```hs
import Data.List (nub, sort)
```

## 修飾付きインポート

`Data.Map`モジュールは`filter`など、`Prelude`にある関数と同名の関数を多くエクスポートしている。そのため、`Data.Map`をインポートして`filter`を呼び出すと、Haskellはどちらを呼び出せばよいのかわからなくなってしまう

上記の問題を解決するためには`qualified`を使う

```hs
import qualified Data.Map
```

この状態で`Data.Map`の`filter`を利用する場合は、`Data.Map.filter`と指定する

しかし、毎回`Data.Map.filter`と入力するのは面倒なので、以下のようにして別名をつけると、`M.filter`のように指定することができる

```hs
import qualified Data.Map as M
````

## テストに関しての補足

### `test/Spec.hs`の記述

```
{-# OPTIONS_GHC -F -pgmF hspec-discover #-}
```

```
{-# OPTIONS_GHC ... #-}
```

GHCコンパイラに対する**プラグマ（pragma）**と呼ばれる指示文。ソースコード内でコンパイラの動作を制御するために使用される

```
-F
```

GHCに対してプリプロセッサを使用することを指示するフラグ。プリプロセッサは、Haskellコードをコンパイルする前に別のプログラムでソースコードを変換する仕組み

```
-pgmF hspec-discover
```

- `-pgmF`: プリプロセッサとして使用するプログラムを指定するオプション
- `hspec-discover`: 実際に使用するプリプロセッサプログラムの名前

hspec-discoverはテスト自動発見ツール。以下のコードを自動生成する

```hs
-- 自動生成されるコード（実際には見えない）
module Main where

import Test.Hspec
import qualified Geometry.SphereSpec

main :: IO ()
main = hspec $ do
  Geometry.SphereSpec.spec
  -- 他のテストファイルがあれば、それらも自動的に追加される
```

`test/Spec.hs`に`{-# OPTIONS_GHC -F -pgmF hspec-discover #-}`を記述することにより、テストファイルのインポートのし忘れを防げる

