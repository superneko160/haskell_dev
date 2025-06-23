# Haskell_dev

For learning Haskell.

## Starting a new project

```sh
mkdir project && cd project
cabal init
cabal run
```

## Test

```sh
cabal test
```

[hspec](https://github.com/hspec/hspec)を利用

### テストが正常に動作しない場合

基本的には、`.cabal`ファイルの記述を読んで必要なテストツールをインストールするが、もし正常に動作しない場合、手動でインストール

```sh
cabal update
cabal install --lib hspec
cabal install hspec-discover
```

### 日本語でテスト概要を記述する場合

環境によっては、日本語でテスト概要が出ないケースがある。日本語で記述したい場合、ロケールを変更する

```sh
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
```

