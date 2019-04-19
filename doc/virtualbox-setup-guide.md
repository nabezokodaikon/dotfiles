# VirtualBox setup guid

## ゲスト側の設定
### ポートフォワーディング
1. 設定
1. ネットワーク
1. 高度
1. ポートフォワーディング
### 設定
* 名前
  * 任意
* プロトコル
  * TCP
* ホストIP
  * 空白
* ホストポート
  * ホストから接続しに行くポート番号
* ゲストIP
  * 空白
* ゲストポート
  * ゲストが公開しているポート番号(sshの場合は、デフォルトが`22`)
### openssh-server
```
$ sudo apt install openssh-server
```

## ホスト側の設定
### ~/.ssh/config ファイル
```
$ mkdir ~/.ssh
$ chmod 700 ~/.ssh
$ touch config
```
### config ファイル
```
# Comment
Host example
     HostName example.com
     User example
     Port 22222
     IdentityFile ~/.ssh/example.key
     TCPKeepAlive yes
     IdentitiesOnly yes
```
### 接続
```
# ポート名を指定するケース
$ ssh ユーザー名@ホスト名 -p ポート番号

# 公開鍵認証のケース
$ ssh ユーザー名@ホスト名 -i ~/.ssh/鍵のパス

# ポート名、公開鍵認証のケース
$ ssh ユーザー名@ホスト名 -i ~/.ssh/鍵のパス -p ポート番号

# configファイル参照
$ ssh example
```
