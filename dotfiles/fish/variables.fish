set -Ux HIST_STAMPS "dd.mm.yyyy"

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -Ux EDITOR vim
set -Ux BUNDLER_EDITOR vim

set -Ux LC_ALL en_US.UTF-8
set -Ux LANG en_US.UTF-8

set -g fish_user_paths "/usr/local/opt/gnu-getopt/bin" $fish_user_pa
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "$GOPATH/bin" $fish_user_paths
