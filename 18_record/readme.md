# レコード構文

データ型で人物情報を扱うとする

```hs
data Person = Person String String Int Float String String deriving (Show)
```

```hs
let jhon = Person "Jhon" "Doe" 32, 173.5 "999-9999" "Chocolate"
```
この場合、苗字など特定の情報を取得するには、それ用の関数が必要になる

```hs
firstName :: Person -> String
firstName (Person firstName _ _ _ _ _) = firstName
```
```hs
lastName jhon
```

```hs
lastName :: Person -> String
lastName (Person _ lastName _ _ _ _) = lastName
```

```hs
firstName jhon
```

不必要な情報を`_`で記述しているが、かなり冗長なコードになってしまう

レコード構文を利用すると、簡潔に記述できる

```hs
data Person = Person {
    firstName :: String,
    lastName :: String,
    age :: Int,
    height :: Float,
    phoneNumber :: String,
    flavor :: String
} deriving (Show)
```

この構文の利点は、データ型と同時に、フィールドを取得する関数を作成できる点。（`firstName` `lastName` `age` `height` `phoneNumber` `flavor` という6つの関数を自動的に作成してくれる）

