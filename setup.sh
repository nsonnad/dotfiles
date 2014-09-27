#!/bin/sh
# symbolic links
# loop over list of things that need to be ln -s to home
# link ipython custom css


# CHECK THIS: install xcode command line tools first

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install homebrew stuff
brew bundle Brewfile

links=(.bash_profile .ghci .slate .vimrc .zshenv .zshrc .tmux.conf)

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
