# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# Base16 Shell
BASE16_SCHEME="eighties"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

#alias gcc='/usr/local/bin/gcc-4.8'
#alias cc='/usr/local/bin/gcc-4.8'
#alias g++='/usr/local/bin/g++-4.8'

# aliases
alias zshconfig="vim ~/docs/dotfiles/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias t2="tree -L 2"
alias t3="tree -L 3"
alias ipynote="ipython notebook --profile=n --pylab=inline"
alias vimrc="vim ~/docs/dotfiles/.vimrc"
alias penta="vim ~/docs/dotfiles/firefox/.pentadactylrc"

alias wd='. /Users/nikhil/bin/wd/wd.sh'
alias wd='. /Users/nikhil/bin/wd/wd.sh'

alias update-pip="pip freeze | cut -d = -f 1 | xargs -n 1 pip search | grep -B2 'LATEST:'"
alias update-brew="brew update && brew upgrade"

# common aliases, taken from https://github.com/robbyrussell/oh-my-zsh/pull/1866
# ----------------------------------------------------------------------
alias ls='ls -FHG' #I like color
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias zshrc='vim ~/docs/dotfiles/.zshrc'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5'

alias tl='tail -f'

# cd, because typing the backslash is A LOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du --max-depth=1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias j='jobs'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

stty stop undef # to unmap ctrl-s
# Custom tools
# --------------------------

# hr
# --------------------------
alias hr='hr █'

# todo.txt
# --------------------------
# alias to td because of twitter thing
alias td='todo.sh -d $HOME/Dropbox/todo/todo.cfg'

# twitter gem
# --------------------------
alias tw='/Users/nikhil/.rvm/gems/ruby-2.0.0-p353/bin/t'

alias batt='pmset -g batt'

# Python
#export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
#export PIP_VIRTUALENV_BASE=$WORKON_HOME
#export PIP_RESPECT_VIRTUALENV=true
#if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    #source /usr/local/bin/virtualenvwrapper.sh
#else
    #echo "WARNING: Can't find virtualenvwrapper.sh"
#fi

# Enable reattach-to-user-namespace on Mac. See
# https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/issues/8
#if [[ "$(uname)" == "Darwin" ]]; then
  #alias tmux='tmux -2'
#else
  #alias tmux='tmux -2'
#fi

# Export TERM correctly for tmux
#[[ $TERM == "screen" ]] && export TERM=screen-256color
#[[ $TERM == "xterm" ]] && export TERM=xterm-256color

# command line calculator with =
function \=() {
    calc="${@//p/+}"
    calc="${calc//x/*}"
    bc -l <<<"scale=10;$calc"
}

# R-vim tweaks
if [[ "x$DISPLAY" != "x" ]]; then
    if [[ "x$TERM" = "xrxvt-256-color" ]] || [[ "x$TERM" == "xxterm-256color" ]]
    then
function tvim(){
            tmux -2 new-session "TERM=xterm-256color vim --servername VIM $@" ;
        }
    else
function tvim(){
            tmux new-session "vim --servername VIM $@" ;
        }
    fi
else
if [[ "x$TERM" == "xrxvt-256color" ]] || [[ "x$TERM" == "xxterm-256color" ]]
    then
function tvim(){
            tmux -2 new-session "TERM=xterm-256color vim $@" ;
        }
    else
function tvim(){
            tmux new-session "vim $@" ;
        }
    fi
fi

NPMRC_STORE=~/docs/dotfiles/npmrcs/
NPMRC=~/docs/dotfiles/npmrcs/default
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# wd plugin seems to fuck shit up
plugins=(brew osx vi-mode git sublime pass)
#
#export LC_CTYPE=C
#export LANG=C
LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
NODE_ENV=development

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
#PATH=$PATH:$HOME/.rvm/bin
export VIMRUNTIME=/usr/local/Cellar/vim/7.4.335/share/vim/vim74
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig
export PATH=/Users/nikhil/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export QZDATA_PATH=/Users/nsonnad/docs/qz/code/qzdata

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
