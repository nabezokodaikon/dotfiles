" カレントディレクトリに .vimprojects ファイルがあったら、プロジェクトを開く
if getcwd() != $HOME
    if filereadable(getcwd(). '/.vimprojects')
        Project .vimprojects
    endif
endif
