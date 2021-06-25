#!/bin/bash

git config --global user.name "nabezokodaikon"
git config --global user.email "nabezoko.daikon@gmail.com"
git config --global color.ui.auto
git config --global core.editor "nvim"
git config --global credential.helper cache --timeout=3155692600

# 改行コードを自動変換しない。
git config --global core.autocrlf false

# git で日本語ファイル名を表示する。
git config --global core.quotepath false

# upstreamが設定されていて、それが同名のブランチ名であるときのみpushする。
git config --global push.default simple

# リモートリポジトリが自己証明書であっても接続する。
git config --global http.sslVerify false

# diffの前後行数を変更。
git config --global diff.context 8

# git log --graph の書式を指定。
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
