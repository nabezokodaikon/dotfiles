#!/bin/sh

# Karabinerの設定をリセットします。
# インポートの前に実行してください。

profile_name=nabezokodaikon
cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli be_careful_to_use__clear_all_values_by_name $profile_name
