build: start-process emacs-dependencies symlink-dependencies docker-dependencies construct-path zsh-change-default-shell
	ruby symlinks.rb
	sudo apt purge ruby # I told you
	echo ""
	echo "-----------INSTALATION FINISHED-----------"
.PHONY:build

isolation-setup: start-process emacs-dependencies construct-path
	echo ""
	echo "-----------ISOLATION SETUP FINISHED-----------"
.PHONY:isolation-setup

construct-path:
	echo "-----------CREATING DOTFILES PATH-----------"
	echo ""
	mkdir -p ~/Workspaces/Personal && mv ../dotfiles ~/Workspaces/Personal
	echo "NOTE: The dotfiles repo was moved to the new path ~/Workspaces/Personal/dotfiles"
	echo "To further editing this path must be visited"
	echo ""
	echo "-----------PATH CREATED-----------"
.PHONY:construct-path

zsh-change-default-shell: zsh-dependencies
	echo "-----------CHANGING DEFAULT SHELLL-----------"
	echo ""
	chsh -s /usr/bin/zsh
	echo "-----------ZSH IS NOW THE DEFAULT SHELL-----------"
.PHONY:zsh-change-default-shell

zsh-dependencies:
	echo "-----------INSTALING ZSH DEPENDENCIES-----------"
	echo ""
	sudo apt install zsh
	echo "-----------ZSH DEPENDENCIES FINISHED-----------"
.PHONY:zsh-dependencies

symlink-dependencies:
	echo "-----------INSTALING SYMLINK DEPENDENCIES-----------"
	echo ""
	sudo apt install build-essential zlib1g-dev libyaml-dev libssl-dev -y
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
	sudo apt install ruby -y # Calm, we will purge this later
	echo "-----------SYMLINK DEPENDENCIES FINISHED-----------"
.PHONY:symlink-dependencies

emacs-dependencies:
	echo "-----------INSTALING EMACS DEPENDENCIES-----------"
	echo ""
	sudo apt update
	sudo apt install fonts-firacode fonts-cantarell silversearcher-ag cmake libvterm-dev emacs ripgrep -y
	echo "-----------EMACS DEPENDENCIES FINISHED-----------"
.PHONY:emacs-dependencies

docker-dependencies:
	echo "-----------INSTALING DOCKER DEPENDENCIES-----------"
	echo ""
	sudo apt install apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
	apt-cache policy docker-ce
	sudo apt install docker-ce
	sudo usermod -aG docker ${USER}
	su - ${USER}
	sudo apt install docker-compose
	echo "-----------DOCKER DEPENDENCIES FINISHED-----------"
.PHONY:docker-dependencies

start-process:
	echo "-----------OWL DOTFILES-----------"
	echo ""
.PHONY:start-process

.SILENT: # this has no purpose but to prevent echoing of commands for all targets
