"--------------------------------
" deoplete.nvim configurations
"--------------------------------
call deoplete#enable()

call deoplete#custom#option({
            \ 'auto_complete_delay': 200,
            \ 'smart_case': v:true,
            \ 'min_pattern_length': 2
            \ })

call deoplete#custom#option('sources', {
            \ '_': ['buffer'],
            \ 'html': ['buffer', 'dictionary', 'file', 'member', 'omni', 'tag'],
            \ 'css': ['buffer', 'dictionary', 'file', 'member', 'omni', 'tag'],
            \ 'javascript.jsx': ['buffer', 'dictionary', 'file', 'member', 'omni', 'tag'],
            \ 'scala': ['buffer', 'dictionary', 'file', 'member', 'omni', 'tag']
            \ })
