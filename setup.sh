#!/bin/bash

# install brew
# homebrew install script

brew update && brew upgrade
brew install Brewfile

# symbolic links
# loop over list of things that need to be ln -s to home
# link ipython custom css

