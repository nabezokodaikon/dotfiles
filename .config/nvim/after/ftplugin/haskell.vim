setlocal tabstop=2
setlocal shiftwidth=2
setlocal dictionary=~/.config/nvim/dict/haskell.dict

call denite#custom#var('outline', 'command', ['hasktags'])
call denite#custom#var('outline', 'options', ['-c'])
