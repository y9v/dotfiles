# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="ylebedev"

# Trim linebreaks and copy to clipboard
alias clip="tr -d '\n' | pbcopy"

# Flush DNS
alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Get OS X Software Updates and Homebrew formulas
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; (cd ~/.vim && rake)'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Ctags
alias update_ctags="ctags -R -f .tags ."

# Make folder and go to it
mkcd() { mkdir -p "$1" && cd "$1" }

# Config files aliases
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias vimrc.before="vim ~/.vimrc.before"
alias vimrc.after="vim ~/.vimrc.after"
alias tmux.conf="vim ~/.tmux.conf"
alias gitconfig="vim ~/.gitconfig"

HIST_STAMPS="dd.mm.yyyy"

# Zsh plugins
plugins=(git tmux bundler brew gem ruby rails)

source $ZSH/oh-my-zsh.sh

# User configuration
export GOPATH="$HOME/go"
export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$GOPATH/bin:$PATH"
export EDITOR="vim"
export BUNDLER_EDITOR="vim"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ssh
ssh-add > /dev/null 2>&1

# rbenv init
eval "$(rbenv init -)"
