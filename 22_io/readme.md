# I/Oアクション

## I/Oアクションとは

実行されると副作用（入力を読んだり画面やファイルになにかを書き出したり）を含む動作をし、結果を返すもの（「I/Oアクションが結果を生成する」と呼ぶ）

文字列を端末に表示するアクションには実際には意味のある返り値がないため、ダミーの値として `()` を使う

`putStrLn` の型を調べると、I/Oアクションを生成しているとわかる

```sh
ghci> :t putStrLn
putStrLn :: String -> IO ()
ghci> :t putStrLn "hello, world"
putStrLn "hello, world" :: IO ()
```

## I/Oアクションどうしをまとめる

複数のI/Oアクションを糊付けして1つにまとめるには `do` を利用する

```hs
main :: IO ()
main = do
    putStrLn "Hello, what's you name?"
    name <- getLine
    putStrLn ("Hey " ++ name)
```

サンプルコードでは `else` 下で2つのI/Oアクションを糊付けしたいので `else` のあとに `do` を追加している

```hs
else do
    putStrLn $ reverseWords line
    main -- 再帰
```

`do` と記述してから命令型プログラムを書くように実行ステップを書き並べている。これらのステップはすべてI/Oアクションである。 `do` を使ってまとめると、糊付けされた1つのI/Oアクションとなる。こうして得られるアクションの型は `IO ()` になる（ `do` のなかの最後のI/Oアクションの型が `IO ()` だから）

`main` の型シグネチャは「main :: IO なにか」になる。「なにか」には具体型が入るが `main` の型宣言は普通、明示しない

### 補足：「なにか」とは

`getLine` は入力を受け取る。この型は以下のようになっている

```sh
ghci> :t getLine
getLine :: IO String
```

`getLine` は `String` を生成するI/Oアクションだとわかる。ユーザの入力を待ち、それから入力された文字列を返す。この `String` が「なにか」に該当し、具体型にあたる

## I/Oアクション下でletを使う

`<-` がI/Oを実行してその結果を名前に束縛するのに対し、 `let` はI/Oアクションのなかで普通の値に名前を与えたいときに使う

```hs
import Data.Char

main = do
    putStrLn "what's your first name?"
    firstName <- getLine
    putStrLn "what's your last name?"
    lastName <- getLine
    let bigFirstName = map toUpper firstName
        bigLastName = ma toUpper lastName
    putStrLn $ "Hey, " ++ bigFirstName ++ " " ++ bigLastName ++ "!!"
```

`<-` はI/Oアクションを実行して、その結果を名前に束縛する。しかし、 `map toUpper firstName` I/Oアクションではなく純粋なHaskellの式である。そういうものには `let` を利用する

