#!/bin/sh
BASE16_PATH="/Users/nikhil/.config/base16-shell/scripts/base16-"
LIGHT_SCHEME="gruvbox-light-hard"
DARK_SCHEME="zenburn"

if [[ $1 = "light" ]]; then
  bash "${BASE16_PATH}${LIGHT_SCHEME}.sh"
  nvim -c q
elif [[ $1 = "dark" ]]; then
  bash "${BASE16_PATH}${DARK_SCHEME}.sh"
  nvim -c q
else
  echo "Please enter either 'light' or 'dark'"
fi

