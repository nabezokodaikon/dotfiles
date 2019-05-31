"--------------------------------
" Ctags command 
"
" Required: Ctags
"--------------------------------
function! s:generateTagsFile()
    call system('ctags -R . /dev/null 2>&1')
    let ret = v:shell_error
    if ret == 0
        echon 'Success to generate tags file!'
    else
        echon 'Failed to generate tags file!'
    endif
endfunction

command! TagsFileGenerate call s:generateTagsFile()
