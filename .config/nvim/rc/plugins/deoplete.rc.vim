"--------------------------------	
" deoplete.nvim	
"--------------------------------	
" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" deniteのフィルターの補完を無効にする。
call deoplete#custom#option('keyword_patterns', {	
   \ 'denite-filter': '',	
   \})	

call deoplete#custom#option({
    \ 'min_pattern_length': 1,
    \})

call deoplete#custom#option('sources', {
    \ 'css': ['buffer', 'lsp'],
    \ 'html': ['buffer', 'file'],
    \ 'graphql': ['buffer'],
    \ 'javascript': ['buffer', 'lsp'],
    \ 'javascriptreact': ['buffer', 'lsp'],
    \ 'scala': ['buffer', 'lsp'],
    \ 'typescript': ['buffer', 'file', 'lsp'],
    \ 'typescriptreact': ['buffer', 'file', 'lsp'],
    \ 'rust': ['buffer', 'lsp'],
    \ 'python': ['buffer', 'lsp'],
    \})

call deoplete#custom#source('lsp', 'input_patterns', {
    \ '_': '\.\w*$',
    \ 'rust': '(\.|::)\w*$',
    \ 'typescript': '\W([$_a-zA-Z0-9\u00C0-\uE007F]+)(<.*>)?\(',
    \ 'typescriptreact': '\W([$_a-zA-Z0-9\u00C0-\uE007F]+)(<.*>)?\(',
    \ })
   
" 補完の余計な文字を除去する。
call deoplete#custom#source('_', 'converters', [
    \ 'converter_remove_paren',
    \ 'converter_remove_overlap',
    \ 'converter_truncate_abbr',
    \ 'converter_truncate_info',
    \ 'converter_truncate_menu',
    \ 'converter_auto_delimiter',
    \])

" 入力以下の候補を削除する。
" call deoplete#custom#source('_',
    " \ 'matchers', ['matcher_fuzzy', 'matcher_length'])

" 補完候補からスニペットを除外する。
call deoplete#custom#source('lsp', 'converters', ['converter_reorder_attr'])
call deoplete#custom#filter('converter_reorder_attr', 'attrs_order', {
    \ 'rust': { 'kind': ['!Snippet'] }
    \})

call deoplete#custom#source('lsp', 'dup', v:false)

" Enterで補完を決定する。
inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "<CR>"

" <C-e>でポップアップウィンドウをキャンセルして閉じる。
inoremap <expr><C-e> deoplete#cancel_popup()

" ログ出力(カレントディレクトリに出力される。)
" call deoplete#custom#option('profile', v:true)
" call deoplete#enable_logging('DEBUG', 'deoplete.log')

call deoplete#enable()
