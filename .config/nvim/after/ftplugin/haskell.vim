setlocal tabstop=4
setlocal shiftwidth=4
setlocal dictionary=~/.config/nvim/dict/haskell.dict

call denite#custom#var('outline', 'command', ['hasktags'])
call denite#custom#var('outline', 'options', ['-c'])
