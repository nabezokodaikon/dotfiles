"--------------------------------
" ファイルの種類に応じた設定
"--------------------------------
if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    autocmd!

    " .config/nvim/ftpluginディレクトリ内に言語ごとの設定ファイルを用意する。

    " HTML
    autocmd BufRead,BufNewFile *.html setfiletype html

    " CSS
    autocmd BufRead,BufNewFile *.css setfiletype css

    " JavaScript
    autocmd BufRead,BufNewFile *.js setfiletype javascript
augroup END
