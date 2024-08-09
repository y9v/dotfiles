install:
	- brew bundle
	# install vim-plug
	- sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	# change shell to fish
	- echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
	- chsh -s /opt/homebrew/bin/fish
	# install oh my fish
	- curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
	# set fish theme
	- omf install harleen

symlink:
	- rm -f ~/.config/nvim/init.vim
	- mkdir ~/.config/nvim
	- ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
	- rm -f ~/.config/fish/config.fish
	- ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
	- ln -s ~/dotfiles/fish/functions/user.fish ~/.config/fish/functions/user.fish
	- rm -f ~/.gnupg/gpg-agent.conf
	- mkdir ~/.gnupg
	- chown -R $(whoami) ~/.gnupg/
	- chmod 600 ~/.gnupg/*
	- chmod 700 ~/.gnupg
	- ln -s ~/dotfiles/gpg-agent.conf ~/.gnupg/gpg-agent.conf
	- ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
	- rm -f ~/.gnupg/gpg-agent.conf
	# do not display last login timestamp
	- touch ~/.hushlogin
