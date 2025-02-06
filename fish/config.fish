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

set -Ux EDITOR nvim
set -Ux BUNDLER_EDITOR nvim

if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
