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

alias update-pip="pip freeze | cut -d = -f 1 | xargs -n 1 pip search | grep -B2 'LATEST:'"

# VIMWIKI aliases
#alias todo="nvim -c 'Zen' ~/docs/vimwiki/todo.md"
#alias vw="cd ~/docs/vimwiki && nvim -c 'VimwikiIndex' -c 'Zen'"
#alias routine="nvim -c 'Zen' ~/docs/vimwiki/schedule.md"
#alias agenda="nvim -c 'Zen' ~/docs/vimwiki/agenda.md"
#alias today="nvim -c 'VimwikiMakeDiaryNote' -c 'Zen'"
#alias diary="nvim -c 'VimwikiDiaryIndex' -c 'Zen'"
#alias scratchpad="nvim ~/docs/vimwiki/Scratchpad.md -c 'Zen'"
#alias projects="nvim ~/docs/vimwiki/projects.md -c 'Zen'"

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

alias weather='curl -4 http://wttr.in/Minneapolis'
alias batt='pmset -g batt'

# Python
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

# wd plugin seems to fuck shit up
plugins=(macos vi-mode git pass)
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

source $ZSH/oh-my-zsh.sh
# aws tab completion
#source /usr/local/share/zsh/site-functions/_aws

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

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
