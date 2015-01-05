#!/bin/bash
brew tap caskroom/fonts

fonts=(
    font-m-plus
)

echo "installing fonts..."
brew cask install ${fonts[@]}
