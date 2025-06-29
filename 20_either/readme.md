# Either

`Either` の定義はおおよそ以下の通り

```hs
data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)
```

`Either a b` には値コンストラクタが2つある。 `Left` を使うと `Either` の中身は `a` 型になる。 `Right` を使ったときは、中身は `b` 型になる。つまり `Either` を使って「2つの型のうちどちらか一方」を表せる。 `Left` と `Right` をパターンマッチして、どちらの型に合致したかに応じて異なる処理をする、という使い方をよくする

## 例

以下はロッカーを表す `Map` から暗証番号を検索する関数。この関数の結果は `Either String Code` 型で返す。つまり `Either` の `Left` が `String` 、 `Right` が `Code` を返す

```hs
lockerLookUp :: Int -> LockerMap -> Either String Code
lockerLookUp lockerNumber list = case Map.lookup lockerNumber list of
    Nothing -> Left $ "Locker " ++ show lockerNumber ++ " doesn't exist!"
    Just(state, code) -> if state /= Taken
                        then Right code
                        else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"
```

まず `Map` を `lookup` する。 `Data.Map.lookup` は手続き型言語における `Map.get(key)` や `Map[key]` に相当する操作。 `lockerNumber` から値である `(state, code)` を取得する

`case` 式は、式である点を除けば`Java` 等とほとんど同じ。構文は以下の通り

```hs
case expression of pattern -> result
                   pattern -> result
                   patterun -> result
```

`lookup` で `Nothing`が返ったら、 `Left String` 値コンストラクタを使い、「ロッカーがない」という返事をする。ロッカーが存在する場合は、 `state` を参照してロッカーが使用中かどうか調べる。すでに使われている場合は、「使用中である」という旨のメッセージを含んだ `Left` 値を返す。空いていれば `Right Code`  値を返して暗証番号を伝える

