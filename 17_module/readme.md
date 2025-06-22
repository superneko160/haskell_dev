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

