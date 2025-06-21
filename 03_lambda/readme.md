# ラムダ式

1回だけ必要な関数を作成するときに使う無名関数

## 構文

```hs
\引数 -> 関数の本体
```

### 例

以下は`where`で記述されている`isLong`という自作関数をラムダ式に書き直した例

```hs
numLongChains = length (filter isLong (map chain [1..100]))
  where isLong xs = length xs > 15
```

```hs
numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))
```

## 注意

カリー化と部分適用の動作を理解していないと、必要のない箇所でラムダ式を使ってしまいがち

以下の式は等価だが、部分適用のほうが可読性が高い

```hs
map (+3) [1, 6, 3, 2]
```

```hs
map (\x -> x + 3) [1, 6, 3, 2]
```
