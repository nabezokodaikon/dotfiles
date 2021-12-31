"--------------------------------
" Initial configurations
"--------------------------------
filetype off
filetype plugin indent off


" OS判定。
" https://github.com/glepnir/nvim/blob/master/lua/core/global.lua


" Set disable providers
lua << EOF
    vim.g.loaded_node_provider = 0
    vim.g.loaded_perl_provider = 0
    vim.g.loaded_python_provider = 0
    vim.g.loaded_python3_provider = 0
    vim.g.loaded_ruby_provider = 0
EOF


" Basic settings
luafile ~/.config/nvim/lua/basic.lua

" Key mappings
luafile ~/.config/nvim/lua/mappings.lua

" File type settings
luafile ~/.config/nvim/lua/filetypes.lua

" Tab settings
source ~/.config/nvim/rc/tab.rc.vim

" プラグイン管理設定
source ~/.config/nvim/rc/dein/dein.rc.vim


filetype plugin indent on
