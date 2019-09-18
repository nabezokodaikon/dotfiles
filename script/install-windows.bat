REM Uninstall
rmdir /s /q %LOCALAPPDATA%\nvim
rmdir %USERPROFILE%\.config

REM Install
mkdir %LOCALAPPDATA%\nvim
mklink %LOCALAPPDATA%\nvim\init.vim %USERPROFILE%\dotfiles\.config\nvim\init.vim
mklink %LOCALAPPDATA%\nvim\ginit.vim %USERPROFILE%\dotfiles\.config\nvim\ginit.vim
mklink /D %USERPROFILE%\.config %USERPROFILE%\dotfiles\.config
