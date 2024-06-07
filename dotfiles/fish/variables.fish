set -Ux HIST_STAMPS "dd.mm.yyyy"

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -Ux EDITOR vim
set -Ux BUNDLER_EDITOR vim

set -Ux LC_ALL en_US.UTF-8
set -Ux LANG en_US.UTF-8

set -g fish_user_paths "/usr/local/opt/gnu-getopt/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/bin" $fish_user_paths

set -g fish_user_paths "(brew --prefix)/opt/coreutils/libexec/gnubin" $fish_user_paths
set -g fish_user_paths "(brew --prefix)/opt/findutils/libexec/gnubin" $fish_user_paths
set -g fish_user_paths "(brew --prefix)/opt/gnu-sed/libexec/gnubin" $fish_user_paths

set -g fish_user_paths "$HOME/.asdf/shims" $fish_user_paths

set -g fish_user_paths $fish_user_paths "$HOME/development/carwow/dev-environment/bin"
