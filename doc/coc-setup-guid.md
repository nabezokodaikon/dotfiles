# coc.nvim setup guide
[coc.nvim](https://github.com/neoclide/coc.nvim)

## Haxe
[Haxe support #510](https://github.com/neoclide/coc.nvim/issues/510)

## Rust
[neoclide/coc-rls](https://github.com/neoclide/coc-rls)
```
:CocInstall coc-rls
```

## Scala
### LSP server
* [Metals](https://scalameta.org/metals/)
  * [Metals works with most LSP clients for Vim:](https://scalameta.org/metals/docs/editors/vim.html)
### Setup
#### 1. Java8をインストールする
Mac
```
$ brew cask install caskroom/versions/adoptopenjdk8
$ export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
```
Linux
```
$ export JAVA_HOME=$(readlink -f `which javac 2>/dev/null` | sed "s:/bin/javac::")
```
#### 2. Metalsを生成する
```
$ curl -L -o coursier https://git.io/coursier
$ chmod 744 coursier
$ ./coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=coc.nvim \
  org.scalameta:metals_2.12:0.5.2 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o /usr/local/bin/metals-vim -f
```
`coursier`ファイルは削除しても構わない。
#### 3. .gitignoreに追加する 
```
.bloop
.metals
project/.bloop
```
#### 4. Scalaファイルを開いたときに、Metalsを起動する
* `1 - Import build`を選択する。
* 表示しないを選択した場合は、`.metals`ディレクトリを削除して開き直す。

## TypeScript
[neoclide/coc-tsserver](https://github.com/neoclide/coc-tsserver)
```
:CocInstall coc-tsserver
```
