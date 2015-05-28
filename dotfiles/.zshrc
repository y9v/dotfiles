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
alias update='brew update; brew upgrade --all; brew cleanup; (cd ~/.vim && rake); upgrade_oh_my_zsh'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Index ctags
alias update_ctags="ctags -R -f .tags ."

# Make folder and go to it
mkcd() { mkdir -p "$1" && cd "$1" }

# Run single ruby test
single_test() { bundle exec ruby -I"lib:test" "test/$1_test.rb" }

# Config files aliases
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias vimrc.before="vim ~/.vimrc.before"
alias vimrc.after="vim ~/.vimrc.after"
alias tmux.conf="vim ~/.tmux.conf"
alias gitconfig="vim ~/.gitconfig"

# Date format for commands
HIST_STAMPS="dd.mm.yyyy"

# Zsh plugins
plugins=(git tmux bundler brew gem ruby rails)

source $ZSH/oh-my-zsh.sh

# User configuration
export GOPATH="$HOME/go"
export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin:$PATH"
export EDITOR="vim"
export BUNDLER_EDITOR="vim"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load ssh keys
ssh-add > /dev/null 2>&1

# rbevn
eval "$(rbenv init -)"
