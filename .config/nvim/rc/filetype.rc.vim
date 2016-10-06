"--------------------------------
" ファイルの種類に応じた設定
"--------------------------------
if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    autocmd!

    " .config/nvim/ftpluginディレクトリ内に言語ごとの設定ファイルを用意する。

    " JavaScript
    autocmd BufRead,BufNewFile *.js setfiletype javascript
augroup END
