# Applicative Functor

Functorは `fmap` を使ったコンテキスト化された値に関数を適用できるが、その関数自体がコンテキスト化されている場合（たとえば `Maybe (a -> b)` のような場合）は `fmap` だけでは対応できない

アプリカティブファンクタは `fmap` の機能に加え、 `(<*>)` 演算子と `pure` 関数を提供する

- `pure` :通常の値をコンテキストに入れる。たとえば `pure 3` は `Just 3` や `[3]` のようになる
- `(<*>` :コンテキスト化された関数を、コンテキスト化された値に適用する

つまり、アプリカティブファンクタを使うと、複数のコンテキスト化された値に対して、コンテキスト化されていない関数を適用できる

## サンプルコード

### Maybeの例

`addTwoNumbers` は2つの整数を加算する普通の関数

1. `pure addTwoNumbers` : `addTwoNumbers` という関数を `Maybe` コンテキストに入れます。つまり `Just(\ x y -> x + y)` のような形になる
2. `(<*>) Just 5` : `Just (\x y -> x + y)` というコンテキスト化された関数に `Just 5` というコンテキスト化された値を適用する。これにより、部分的に適用された関数 `Just(\y -> 5 + y)` が得られる
3. `(<*>) Just 10` : さらに `Just(\y -> 5 + y)` に `Just 10` を適用する。これで `Just (5 + 10)` 、つまり `Just 15` が得られる
4. `Nothing` が含まれる場合 : 1つでも `Nothing` があれば、結果全体が `Nothing` となる


### リストの例

`exampleListCombinations` : `pure addTwoNumbers <*> [1, 2] <*> [10, 20]`

1. `pure addTwoNumbers` は `[addNumbers]` になる
2. `[addTwoNumbers] <*> [1, 2]` は `[addTwoNumbers 1, addTwoNumbers 2]` になる（つまり、部分適用された関数のリスト）
3. さらにこれに `[10, 20]` を `(<*>)` で適用すると、 `addTwoNumbers 1` を `10` と `20` に、 `addTwoNumbers 2` を `10` と `20` にそれぞれ適用した結果のリスト `[1+10, 1+20, 2+10, 2+20]` 、つまり `[11, 21, 12, 22]` が得られる

