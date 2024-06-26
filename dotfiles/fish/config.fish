source ~/.config/fish/aliases.fish
source ~/.config/fish/variables.fish
source ~/.config/fish/user_functions.fish
source ~/.config/fish/local.fish

set fish_greeting ""
set theme_color_scheme gruvbox

function fish_mode_prompt; end
function fish_vi_cursor; end

fish_vi_key_bindings

# use gpg agent instead of ssh agent
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

export BAT_STYLE=numbers,changes
export BAT_THEME=1337

source /opt/homebrew/opt/asdf/libexec/asdf.fish
