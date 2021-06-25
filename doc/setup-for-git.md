# Setup for Git

## 基本設定
以下を実行する。
```bash
$ ~/dotfiles/script/git-config.sh
```

## パスワードを保存する
`git push`などでユーザー名とパスワードを入力し、その直後に以下を実行する。
```bash
$ git config --global credential.helper store
```
`~/.git-credentials`というファイルに保存される。
[gitでパスワードを保存する](https://chaingng.github.io/post/git_save_pw/#credentialhelper%E3%81%AE%E4%BF%9D%E5%AD%98%E3%83%A2%E3%83%BC%E3%83%89)
