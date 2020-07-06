set -Ux HIST_STAMPS "dd.mm.yyyy"

set -Ux PATH $HOME /usr/local/bin /usr/bin /bin /usr/sbin /sbin $PATH
set -Ux fish_user_paths "/usr/local/sbin" $fish_user_paths

set -Ux EDITOR vim
set -Ux BUNDLER_EDITOR vim

set -Ux LC_ALL en_US.UTF-8
set -Ux LANG en_US.UTF-8

set -Ux fish_user_paths "/usr/local/opt/gnu-getopt/bin:/usr/local/opt/openssl/bin" $fish_user_paths
set -Ux fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
