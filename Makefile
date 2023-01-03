# Setups

# Complete builds
build: terminal containers editor
	echo "Setup finished!"
.PHONY: build

# build only terminal things
terminal: oh-my-zsh
	echo "Setup terminal finished!"
.PHONY: terminal

# build editor things
editor: doom-emacs
	echo "Setup editor finished!"
.PHONY: editor

# build docker dependencies
containers: docker-compose
	echo "Setup containers finished!"
.PHONY: docker

# Tools

zsh:
	sudo apt install zsh
.PHONY: zsh

oh-my-zsh: zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
.PHONY: oh-my-zsh

docker:
	sudo apt install docker
.PHONY: docker

docker-compose: docker
	sudo apt install docker-compose
.PHONY: docker-compose

emacs:
	sudo apt install emacs
.PHONY:emacs

doom-emacs: emacs
	git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
	~/.emacs.d/bin/doom install
.PHONY: doom-emacs

help-makefile:
	echo "https://makefiletutorial.com/"
.PHONY: help-makefile

.SILENT: # this has no purpose but to prevent echoing of commands for all targets
