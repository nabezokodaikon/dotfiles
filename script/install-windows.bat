REM Uninstall
rmdir /s /q %LOCALAPPDATA%\nvim
rmdir %USERPROFILE%\.config
del %USERPROFILE%\.tigrc
del %AppData%\Code\User\settings.json
del %AppData%\Code\User\keybindings.json

REM Install
mkdir %LOCALAPPDATA%\nvim
mklink %LOCALAPPDATA%\nvim\init.lua %USERPROFILE%\dotfiles\.config\nvim\init.lua
mklink %LOCALAPPDATA%\nvim\ginit.vim %USERPROFILE%\dotfiles\.config\nvim\ginit.vim
mklink /D %USERPROFILE%\.config %USERPROFILE%\dotfiles\.config
mklink %USERPROFILE%\.tigrc %USERPROFILE%\dotfiles\tig\.tigrc
mklink %APPDATA%\Code\User\settings.json %USERPROFILE%\dotfiles\vscode\settings.json
mklink %APPDATA%\Code\User\keybindings.json %USERPROFILE%\dotfiles\vscode\keybindings.json
