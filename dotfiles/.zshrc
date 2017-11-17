# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ylebedev"

DISABLE_AUTO_UPDATE="true"

alias clip="tr -d '\n' | pbcopy"
alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
alias update='brew update; brew upgrade; brew cleanup; upgrade_oh_my_zsh'
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias mux="tmuxinator"

# Make folder and go to it
mkcd() { mkdir -p "$1" && cd "$1" }

# Zsh plugins
plugins=(git tmux gem cargo vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
export HIST_STAMPS="dd.mm.yyyy"
export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export EDITOR="nvim"
export BUNDLER_EDITOR="nvim"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load ssh keys
ssh-add > /dev/null 2>&1

# Go path
export GOPATH="$HOME/go"
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Python path
export PATH=~/anaconda/bin:$PATH

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
