#!/bin/bash

# Vim のプラグイン管理ツール NeoBundle をインストールします。 
git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim

# Vim のプラグインをインストールします。
vim -u $HOME/dotfiles/.vimrc.init -c NeoBundleInstall! -c q

exit 0
