# ファイル処理

## openFile関数

指定されたファイルを指定されたモードを開くI/Oアクションを返す

```sh
openFile :: FilePath -> IOMode -> IO Handle
```

### FilePath

String型の型シノニム

```sh
type FilePath = String
```

### IOMode

開いたファイルに対してなにを行いたいかを列挙した型

```sh
data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
```

## withFile関数

ファイルのパスとIOMode、「ハンドルを受け取ってI/Oアクションを返す関数」を受け取り、「そのファイルを開いてからなにかして閉じる」というI/Oアクションを返す

```sh
withFile :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
```

サンプルではラムダ式で関数を渡している

```hs
withFile "baabaa.txt" ReadMode $ \handle -> do
    contents <- hGetContents handle
    putStr contents
```

