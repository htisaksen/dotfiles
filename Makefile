.PHONY: all
all: brew zsh dotfiles all-apps

.PHONY: brew
brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby 
	xargs brew install < my_brews.txt

.PHONY: dotfiles
dotfiles:
	@# Link ssh dir
	mkdir -p $(HOME)/.ssh
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

.PHONY: zsh
zsh:
	git clone https://github.com/powerline/fonts.git --depth=1
	./fonts/install.sh
	rm -rf fonts
	brew install zsh zsh-completions
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o install-oh-my-zsh.sh;
	sh install-oh-my-zsh.sh
	rm install-oh-my-zsh.sh
	chsh -s /usr/bin/zsh
	git clone https://github.com/denysdovhan/spaceship-prompt.git /${HOME}/.oh-my-zsh/custom/themes/spaceship-prompt
	ln -s ${HOME}/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ${HOME}/.oh-my-zsh/custom/themes/spaceship.zsh-theme

.PHONY: all-apps
all-apps: apps dev-apps
	@# Install all apps

.PHONY: apps
apps:
	brew cask install google-backup-and-sync
	brew cask install slack
	brew cask install spotify
	brew cask install private-internet-access
	brew cask install homebrew/cask-versions/firefox-developer-edition
	brew cask install firefox

.PHONY: dev-apps
dev-apps:
	brew cask install intellij-idea
	brew cask install java
	brew install maven
	brew cask install visual-studio-code
	brew cask install keepassxc
	brew cask install docker
	brew cask install postman
	brew cask install pycharm