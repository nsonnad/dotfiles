# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="refined"

autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

# COLORS
# --------------
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

LIGHT_SCHEME="gruvbox-light-hard"
DARK_SCHEME="onedark"
alias colorlight="base16_$LIGHT_SCHEME && nvim -c q"
alias colordark="base16_$DARK_SCHEME && nvim -c q"

# aliases
alias zshconfig="vim ~/docs/dotfiles/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias t2="tree -L 2"
alias t3="tree -L 3"
alias ipynote="ipython notebook --profile=n"
alias vimrc="vim ~/docs/dotfiles/.vimrc"
alias penta="vim ~/docs/dotfiles/firefox/.pentadactylrc"
alias pgdown='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pgup='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

alias wd='. /Users/nikhil/bin/wd/wd.sh'
alias wd='. /Users/nikhil/bin/wd/wd.sh'

alias update-pip="pip freeze | cut -d = -f 1 | xargs -n 1 pip search | grep -B2 'LATEST:'"
alias update-brew="brew update && brew upgrade"
alias update-slush="npm uninstall -g slush-qz-thing && npm install -g git+ssh://git@github.com:quartz/slush-qz-thing.git"
alias pomo="pomojs -q --log ~/Dropbox/.pomo.log --tmux"

# VIMWIKI aliases
alias vimwiki="nvim -c 'VimwikiIndex'"
alias journal="nvim -c 'VimwikiDiaryIndex'"
alias today="nvim -c 'VimwikiMakeDiaryNote'"

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
alias -g L="| less -r"
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

alias todo='nvim ~/Dropbox/notes/todo.md'
alias weather='curl -4 http://wttr.in/New_York'
alias qnotes='nvim ~/Dropbox/notes'
alias notes='cd ~/Dropbox/notes && nvim'
alias batt='pmset -g batt'

# Python
export WORKON_HOME=$HOME/.virtualenvs   # optional
export PROJECT_HOME=$HOME/python-projects      # optional
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh
#export WORKON_HOME=$HOME/.virtualenvs
##export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
##export PIP_VIRTUALENV_BASE=$WORKON_HOME
##export PIP_RESPECT_VIRTUALENV=true
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

vol () {
  osascript -e "set volume output volume $*";
}

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
plugins=(osx vi-mode git pass)
#
#export LC_CTYPE=C
#export LANG=C
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export NODE_ENV=development
export TERM=xterm-256color
export FZF_DEFAULT_COMMAND='ag -g ""'

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home/

source $ZSH/oh-my-zsh.sh
# aws tab completion
#source /usr/local/share/zsh/site-functions/_aws
source ~/docs/dotfiles/local.sh

# Customize to your needs...
export PATH=$PATH:$HOME/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.stack/programs/x86_64-osx/ghc-7.10.3/bin:$PATH
export EDITOR='nvim'
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/texbin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH="/Users/nikhil/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/nikhil/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/nikhil/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/nikhil/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/nikhil/perl5"; export PERL_MM_OPT;
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# added by Miniconda3 installer
# export PATH="/Users/nikhil/miniconda3/bin:$PATH"
