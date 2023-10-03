# Debian based distros dependencies

deb-build: deb-emacs-dependencies deb-symlink-dependencies deb-zsh-dependencies construct-path zsh-change-default-shell #deb-docker-dependencies
	ruby symlinks.rb
	sudo apt purge ruby # I told you
	echo ""
	echo "-----------INSTALATION FINISHED-----------"

deb-isolation-setup: deb-emacs-dependencies construct-path
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

# Arch based distros dependencies

arch-build: arch-emacs-dependencies arch-symlink-dependencies construct-path
	rm ~/.zshrc
	ruby symlinks.rb
	yes | sudo pacman -Rs ruby # I told you
	echo ""
	echo "-----------INSTALATION FINISHED-----------"

arch-isolation-setup: arch-emacs-dependencies construct-path
	echo ""
	echo "-----------ISOLATION SETUP FINISHED-----------"

arch-symlink-dependencies:
	echo "-----------INSTALING SYMLINK DEPENDENCIES-----------"
	echo ""
	yes | sudo pacman -S base-devel 
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
	yes | sudo pacman -S ruby # Calm, we will purge this later
	echo "-----------SYMLINK DEPENDENCIES FINISHED-----------"

arch-emacs-dependencies:
	echo "-----------INSTALING EMACS DEPENDENCIES-----------"
	echo ""
	yes | sudo pacman -Syu
	yes | sudo pacman -S emacs ttf-fira-code cantarell-fonts libvterm cmake the_silver_searcher ripgrep 
	echo "-----------EMACS DEPENDENCIES FINISHED-----------"

# Operations

construct-path:
	echo "-----------CREATING DOTFILES PATH-----------"
	echo ""
	mkdir -p ~/Workspaces/Personal && mv ../dotfiles ~/Workspaces/Personal
	echo "NOTE: The dotfiles repo was moved to the new path ~/Workspaces/Personal/dotfiles"
	echo "To further editing this path must be visited"
	echo ""
	echo "-----------PATH CREATED-----------"

zsh-change-default-shell:
	echo "-----------CHANGING DEFAULT SHELLL-----------"
	echo ""
	chsh -s /usr/bin/zsh
	echo "-----------ZSH IS NOW THE DEFAULT SHELL-----------"


.SILENT: # this has no purpose but to prevent echoing of commands for all targets
