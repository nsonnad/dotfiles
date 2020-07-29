#!/bin/sh
# Set up a fresh OSX

# tweak a bunch of osx settings
#sh ./.osx

# install xcode command line tools
xcode-select --install

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install homebrew stuff
brew bundle Brewfile

# oh my zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# symbolic links
# loop over list of things that need to be ln -s to home
links=(.bash_profile .ghci .slate .vimrc .zshenv .zshrc .tmux.conf .vimpagerrc)

for f in ${links[@]}; do
  rm ~/$f
  ln -s `pwd`/$f ~/$f
done

# neovim and hammerspoon have special simlink destinations
ln -s `pwd`/.vim ~/.config/nvim
ln -s `pwd`/.nvimrc ~/.config/nvim/init.vim
ln -s `pwd`/hammerspoon ~/.hammerspoon

# global node packages
npm install -g trash

# global python packages
