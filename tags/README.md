# ctags

## このディレクトリに絶対パスで作成したタグファイルを拡張子'.tags'で作成することで vim 起動時に自動で読み込まれる。

### 例
#### ソースコードのダウンロード
```bash
$ git clone -b 2.10.x https://github.com/scala/scala.git ~/dotfiles/tags/scala
```

#### tags ファイル作成
```bash
$ ctags -f ~/dotfiles/tags/scala.tags -R ~/dotfiles/tags/scala/
```

### 注意
* unite-tag を使用する場合、初回のキャッシュに時間が掛かる。
* unite-tag を使用する場合、タグジャンプ後、元の場所に戻るにはバッファを使用する。
* キーワードの上で vim 標準のタグ機能を使用したほうが無難かも。
