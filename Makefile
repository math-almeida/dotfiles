deb-build: start-process emacs-dependencies symlink-dependencies docker-dependencies construct-path zsh-change-default-shell
	ruby symlinks.rb
	sudo apt purge ruby # I told you
	echo ""
	echo "-----------INSTALATION FINISHED-----------"

deb-isolation-setup: start-process emacs-dependencies construct-path
	echo ""
	echo "-----------ISOLATION SETUP FINISHED-----------"

deb-zsh-dependencies:
	echo "-----------INSTALING ZSH DEPENDENCIES-----------"
	echo ""
	sudo apt install zsh
	echo "-----------ZSH DEPENDENCIES FINISHED-----------"

deb-symlink-dependencies:
	echo "-----------INSTALING SYMLINK DEPENDENCIES-----------"
	echo ""
	sudo apt install build-essential zlib1g-dev libyaml-dev libssl-dev -y
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
	sudo apt install ruby -y # Calm, we will purge this later
	echo "-----------SYMLINK DEPENDENCIES FINISHED-----------"

deb-emacs-dependencies:
	echo "-----------INSTALING EMACS DEPENDENCIES-----------"
	echo ""
	sudo apt update
	sudo apt install fonts-firacode fonts-cantarell silversearcher-ag cmake libvterm-dev emacs ripgrep -y
	echo "-----------EMACS DEPENDENCIES FINISHED-----------"

deb-docker-dependencies:
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


arch-zsh-dependencies:
	echo "-----------INSTALING ZSH DEPENDENCIES-----------"
	echo ""
	sudo pamac -S zsh
	echo "-----------ZSH DEPENDENCIES FINISHED-----------"

arch-emacs-dependencies:
	echo "-----------INSTALING EMACS DEPENDENCIES-----------"
	echo ""
	sudo pacman -Sy
	sudo pacman -S emacs ttf-fira-code cantarell-fonts
	echo "-----------EMACS DEPENDENCIES FINISHED-----------"



construct-path:
	echo "-----------CREATING DOTFILES PATH-----------"
	echo ""
	mkdir -p ~/Workspaces/Personal && mv ../dotfiles ~/Workspaces/Personal
	echo "NOTE: The dotfiles repo was moved to the new path ~/Workspaces/Personal/dotfiles"
	echo "To further editing this path must be visited"
	echo ""
	echo "-----------PATH CREATED-----------"

zsh-change-default-shell: zsh-dependencies
	echo "-----------CHANGING DEFAULT SHELLL-----------"
	echo ""
	chsh -s /usr/bin/zsh
	echo "-----------ZSH IS NOW THE DEFAULT SHELL-----------"





start-process:
	echo "-----------OWL DOTFILES-----------"
	echo ""

.SILENT: # this has no purpose but to prevent echoing of commands for all targets
