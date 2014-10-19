#!/bin/sh
# Set up a fresh OSX

mkdir -p ~/docs

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
  ln -s `pwd`$f ~/$f
done

# install node stuff
npm install -g json
npm install -g n
npm install -g trash

# install python stuff
pip install csvkit
pip install ipython
pip install pandas
pip install virtualenv
pip install virtualenvwrapper
