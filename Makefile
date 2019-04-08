initialize: brew zsh vim dotfiles

brew:
	mkdir /tmp/brew
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > /tmp/brew
	/usr/bin/ruby -e
	for i in $(shell cat my_brews.txt); do; echo "$i"; done
	rm -rf /tmp/brew

dotfiles:
	@# Link ssh dir
	@for file in $(shell find $(CURDIR)/.ssh -maxdepth 1 \
			-name "*" \
			-not -name ".ssh"); do \
		f=$$(basename $$file); \
		echo "Link $$file -> ${HOME}/.ssh/$$f"; \
		rm -rf ${HOME}/.ssh/$$f; \
		ln -sf $$file ${HOME}/.ssh/$$f; \
	done

	@# Link other dot files
	@for file in $(shell find $(CURDIR) -maxdepth 1 \
			-name ".*" \
			-not -name ".gitignore" \
			-not -name ".git" \
			-not -name ".*.swp" \
			-not -name ".ssh" \
			-not -name ".config"); do \
		f=$$(basename $$file); \
		echo "Link $$file -> ${HOME}/$$f"; \
		rm -rf $(HOME)/$$f; \
		ln -sf $$file $(HOME)/$$f; \
	done

vim:
	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh

zsh:
	# clone
	git clone https://github.com/powerline/fonts.git --depth=1
	# install
	cd fonts
	./install.sh
	# clean-up a bit
	cd ..
	rm -rf fonts
	brew install zsh zsh-completions
	git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

all-apps: apps dev-apps
	@# Install all apps

apps:
	brew cask install google-chrome
	brew cask install google-drive
	brew cask install caskroom/versions/firefoxdeveloperedition
	brew cask install slack
	brew cask install spotify
	brew cask install firefox

dev-apps:
	brew cask install intellij-idea
	brew cask install java
	brew cask install visual-studio-code
	brew cask install docker
	brew cask install docker-toolbox
