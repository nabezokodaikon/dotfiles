# coc.nvim setup guide
[coc.nvim](https://github.com/neoclide/coc.nvim)

## Warning
extension rootディレクトリが空だとcocのinitializeに失敗してしまうので、作成しておく必要がある。
```
$ mkdir -p ~/.config/coc/extensions 
```

## Sources
[neoclide/coc-sources](https://github.com/neoclide/coc-sources)
```
:CocInstall coc-dictionary
:CocInstall coc-tag
```

## Haxe
[Haxe support #510](https://github.com/neoclide/coc.nvim/issues/510)

## Scala
### LSP server
* [Metals](https://scalameta.org/metals/)
  * [Metals works with most LSP clients for Vim:](https://scalameta.org/metals/docs/editors/vim.html)
### Setup
#### 1. Java8をインストールする
Mac
```
# インストール
$ brew cask install caskroom/versions/adoptopenjdk8
# 環境変数を設定
$ export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
```
Linux
```
# OpenJDKのバージョンを検索
$ sudo apt search openjdk-\(\.\)\+-jdk$
# インストール
sudo apt install openjdk-8-jdk
# 環境変数を設定
$ export JAVA_HOME=$(readlink -f `which javac 2>/dev/null` | sed "s:/bin/javac::")
```
#### 2. SBTに設定を追加する。
`~/.sbt/1.0/plugins/plugins.sbt`
```
resolvers += Resolver.sonatypeRepo("snapshots")
addSbtPlugin("org.scalameta" % "sbt-metals" % "0.5.2+29-221f01bf-SNAPSHOT")
addSbtPlugin("ch.epfl.scala" % "sbt-bloop" % "1.2.5")
```
#### 3. Metalsを生成する
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
#### 4. .gitignoreに追加する 
```
.bloop
.metals
project/.bloop
```
#### 5. Scalaファイルを開いたときに、Metalsを起動する
* `1 - Import build`を選択する。
* 表示しないを選択した場合は、`.metals`ディレクトリを削除して開き直す。
