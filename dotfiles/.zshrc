# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ylebedev"

# Trim linebreaks and copy to clipboard
alias clip="tr -d '\n' | pbcopy"

# Flush DNS
alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Get OS X Software Updates and Homebrew formulas
alias update='brew update; brew upgrade; brew cleanup; upgrade_oh_my_zsh'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Other aliases
alias mux="tmuxinator"

# Make folder and go to it
mkcd() { mkdir -p "$1" && cd "$1" }

# Date format for commands
HIST_STAMPS="dd.mm.yyyy"

# Zsh plugins
plugins=(git tmux brew gem cargo vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$HOME/.rbenv/bin:$(brew --prefix qt@5.5)/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
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

# Docker machine
eval $(docker-machine env default)
