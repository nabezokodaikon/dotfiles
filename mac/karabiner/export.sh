#!/bin/sh

# Karabinerの設定を出力します。

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli export > import.sh
