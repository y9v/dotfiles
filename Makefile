install:
	- brew bundle
	# install vim-plug
	- sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	# change shell to fish
	- echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
	- chsh -s /opt/homebrew/bin/fish
	# install fisher
	- curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
	# set fish theme
	- fisher install IlanCosman/tide@v6
	- set --universal tide_right_prompt_items

symlink:
	- rm -f ~/.config/nvim/init.vim
	- mkdir ~/.config/nvim
	- ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
	- rm -f ~/.config/fish/config.fish
	- ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
	- ln -s ~/dotfiles/fish/functions/user.fish ~/.config/fish/functions/user.fish
	- ln -s ~/dotfiles/gpg-agent.conf ~/.gnupg/gpg-agent.conf
	- ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
	# do not display last login timestamp
	- touch ~/.hushlogin
