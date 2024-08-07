install:
	# install homebrew
	- brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	- brew bundle
	# install vim-plug
	- curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install oh my fish
	- curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
	# set fish theme
	- omf install harleen

symlink:
	- rm -f ~/.config/nvim/init.vim
	- ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
	- rm -f ~/.config/fish/config.fish
	- ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
	- ln -s ~/dotfiles/fish/functions/user.fish ~/.config/fish/functions/user.fish
	- rm -f ~/.gnupg/gpg-agent.conf
	- ln -s ~/dotfiles/gpg-agent.conf ~/.gnupg/gpg-agent.conf
	# do not display last login timestamp
	- touch ~/.hushlogin
