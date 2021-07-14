# VirtualBox setup guid

## VirtualBox Guest Additions
インストール前に、以下のパッケージをインストールすること。
※これをやらないと、**ゲストOSの画面を自動リサイズ**が出来ない。
```bash
sudo apt install gcc make perl
```

## ゲスト側の設定
### SSH接続
#### ポートフォワーディング
1. 設定
1. ネットワーク
1. 高度
1. ポートフォワーディング
#### 設定
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
#### openssh-server
```
$ sudo apt install openssh-server
```

### 共有フォルダ
設定から、共有フォルダを追加する。
**自動マウントにチェックを入れない**
```
# 手動マウント
$ sudo mount -t vboxsf develop /home/nabezokodaikon/workspace/develop
# 自動マウント
$ sudo sh -c "echo 'develop /home/nabezokodaikon/workspace/develop vboxsf defaults 0 0' >> /etc/fstab"
```
#### グループ追加
```
$ sudo adduser nabezokodaikon vboxsf
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
