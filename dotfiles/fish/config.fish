source ~/.config/fish/aliases.fish
source ~/.config/fish/variables.fish
source ~/.config/fish/user_functions.fish

set -Ux fish_greeting ""
set -Ux theme_color_scheme gruvbox

function fish_mode_prompt; end
function fish_vi_cursor; end

fish_vi_key_bindings

# use gpg agent instead of ssh agent
export GPG_TTY=(tty)
gpgconf --launch gpg-agent
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

export BAT_STYLE=numbers,changes
export BAT_THEME=1337

set -Ux fish_user_paths "/usr/local/opt/nss/bin" $fish_user_paths

source /usr/local/opt/asdf/asdf.fish
