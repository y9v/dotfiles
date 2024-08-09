source ~/.config/fish/functions/user.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""
set theme_color_scheme gruvbox
set -U fish_key_bindings fish_vi_key_bindings

eval "$(/opt/homebrew/bin/brew shellenv)"

set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

set -Ux EDITOR vim
set -Ux BUNDLER_EDITOR vim

set -g fish_user_paths "$HOME/.asdf/shims" $fish_user_paths
source /opt/homebrew/opt/asdf/libexec/asdf.fish
