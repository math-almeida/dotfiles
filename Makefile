# Color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RESET='\033[0m'

# Debian based distros dependencies
deb-build: deb-emacs-dependencies deb-symlink-dependencies deb-zsh-dependencies construct-path zsh-change-default-shell #deb-docker-dependencies
	ruby symlinks.rb
	sudo apt purge ruby # I told you

	printf "\n${GREEN}-----------INSTALATION FINISHED-----------${RESET}"

deb-isolation-setup: deb-emacs-dependencies construct-path
	printf "\n${GREEN}-----------ISOLATION SETUP FINISHED-----------${RESET}"

deb-zsh-dependencies:
	printf "\n${GREEN}-----------INSTALING ZSH DEPENDENCIES-----------${RESET}"

	sudo apt install zsh

	printf "\n${GREEN}-----------ZSH DEPENDENCIES FINISHED-----------${RESET}"

deb-symlink-dependencies:
	printf "\n${GREEN}-----------INSTALING SYMLINK DEPENDENCIES-----------${RESET}"

	sudo apt install build-essential zlib1g-dev libyaml-dev libssl-dev -y
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
	sudo apt install ruby -y # Calm, we will purge this later

	printf "\n${GREEN}-----------SYMLINK DEPENDENCIES FINISHED-----------${RESET}"

deb-emacs-dependencies:
	printf "\n${GREEN}-----------INSTALING EMACS DEPENDENCIES-----------${RESET}"

	sudo apt update
	sudo apt install fonts-firacode fonts-cantarell silversearcher-ag cmake libvterm-dev ripgrep -y
	sudo snap install emacs --classic

	printf "\n${GREEN}-----------EMACS DEPENDENCIES FINISHED-----------${RESET}"

deb-docker-dependencies:
	printf "\n${GREEN}-----------INSTALING DOCKER DEPENDENCIES-----------${RESET}"

	sudo apt install apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
	apt-cache policy docker-ce
	sudo apt install docker-ce
	sudo usermod -aG docker ${USER}
	su - ${USER}
	sudo apt install docker-compose

	printf "\n${GREEN}-----------DOCKER DEPENDENCIES FINISHED-----------${RESET}"

# Arch based distros dependencies
arch-build: arch-emacs-dependencies arch-symlink-dependencies construct-path
	yes | sudo pacman -S zsh
	@if [ -f "$$HOME/.zshrc" ]; then rm ~/.zshrc; fi
	ruby symlinks.rb
	yes | sudo pacman -Rs ruby # I told you

	make zsh-change-default-shell

	printf "\n${GREEN}-----------INSTALATION FINISHED-----------${RESET}"

arch-isolation-setup: arch-emacs-dependencies construct-path
	printf "\n${GREEN}-----------ISOLATION SETUP FINISHED-----------${RESET}"

arch-symlink-dependencies:
	printf "\n${GREEN}-----------INSTALING SYMLINK DEPENDENCIES-----------${RESET}"

	yes | sudo pacman -S base-devel 
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
	yes | sudo pacman -S ruby # Calm, we will purge this later

	printf "\n${GREEN}-----------SYMLINK DEPENDENCIES FINISHED-----------${RESET}"

arch-emacs-dependencies:
	printf "\n${GREEN}-----------INSTALING EMACS DEPENDENCIES-----------${RESET}"

	yes | sudo pacman -Syu
	yes | sudo pacman -S emacs ttf-fira-code cantarell-fonts libvterm cmake the_silver_searcher ripgrep 

	printf "\n${GREEN}-----------EMACS DEPENDENCIES FINISHED-----------${RESET}"

# Operations
construct-path:
	printf "\n${GREEN}-----------CREATING DOTFILES PATH-----------${RESET}"

	mkdir -p ~/Workspaces/Personal && mv ../dotfiles ~/Workspaces/Personal

	printf "${RED}\n-----------ATENTION-----------\n${RESET}"
	printf "${BLUE}The dotfiles repo was moved to the new path ~/Workspaces/Personal/dotfiles"
	printf "To further editing this path must be visited${RESET}"
	printf "\n${GREEN}-----------PATH CREATED-----------${RESET}"

zsh-change-default-shell:
	printf "\n${GREEN}-----------CHANGING DEFAULT SHELLL-----------${RESET}"

	chsh -s /usr/bin/zsh

	printf "\n${GREEN}-----------ZSH IS NOW THE DEFAULT SHELL-----------${RESET}"

# TODO: Create function to install desktop config; It must cp the sym to desktop and run inside there.

.SILENT: # this has no purpose but to prevent printfing of commands for all targets
