set -Ux HIST_STAMPS "dd.mm.yyyy"

set -Ux PATH $HOME /usr/local/bin /usr/bin /bin /usr/sbin /sbin $PATH

set -Ux EDITOR nvim
set -Ux BUNDLER_EDITOR nvim

set -Ux LC_ALL en_US.UTF-8
set -Ux LANG en_US.UTF-8

set -Ux GOPATH $HOME/go
set -Ux PATH $PATH $GOPATH/bin
