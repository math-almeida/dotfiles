# Color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RESET='\033[0m'

# Main configuration
build: hyprland arch-emacs-dependencies construct-path
	@yq '.pacman.zsh' packages.yaml | tr -d '[],"' | xargs sudo pacman -S --noconfirm
	@if [ -f "$$HOME/.zshrc" ]; then rm ~/.zshrc; fi
	ruby symlinks.rb
	sudo pacman -Rs ruby --noconfirm # I told you

	printf "${BLUE}Configuration complete, to run hyprland just type ${RED}Hyperland"
	printf "\n${GREEN}-----------INSTALATION FINISHED-----------${RESET}"

# Arch based distros dependencies
arch-based: install-yay arch-emacs-dependencies arch-symlink-dependencies construct-path
	@yq '.pacman.zsh' packages.yaml | tr -d '[],"' | xargs sudo pacman -S --noconfirm
	@if [ -f "$$HOME/.zshrc" ]; then rm ~/.zshrc; fi
	ruby symlinks.rb
	sudo pacman -Rs ruby -- noconfirm # I told you

	make zsh-change-default-shell

	printf "\n${GREEN}-----------ARCH DEPENDENCIES FINISHED-----------${RESET}"

arch-isolation-setup: install-yay arch-emacs-dependencies construct-path
	printf "\n${GREEN}-----------ISOLATION SETUP FINISHED-----------${RESET}"

arch-symlink-dependencies:
	printf "\n${GREEN}-----------INSTALING SYMLINK DEPENDENCIES-----------${RESET}"

	@yq '.pacman.symlink' packages.yaml | tr -d '[],"' | xargs sudo pacman -S --noconfirm
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3

	printf "\n${GREEN}-----------SYMLINK DEPENDENCIES FINISHED-----------${RESET}"

arch-emacs-dependencies:
	printf "\n${GREEN}-----------INSTALING EMACS DEPENDENCIES-----------${RESET}"

	sudo pacman -Syu --noconfirm
	@yq '.pacman.emacs' packages.yaml | tr -d '[],"' | xargs sudo pacman -S --noconfirm
	@yq '.pacman.fonts' packages.yaml | tr -d '[],"' | xargs sudo pacman -S --noconfirm

	printf "\n${GREEN}-----------EMACS DEPENDENCIES FINISHED-----------${RESET}"

# Hyprland
hyprland: install-yay arch-symlink-dependencies hypr-install-desktop-packages
	rm -rf ~/.config/hypr # Remove auto generated hypr config
	cp symlinks.rb Desktop
	cd Desktop && ruby symlinks.rb && cd ..
	rm Desktop/symlinks.rb

	printf "\n${GREEN}-----------HYPRLAND CONFIGURED-----------${RESET}"

hypr-install-desktop-packages:
	printf "\n${GREEN}-----------INSTALING DESKTOP PACKAGES-----------${RESET}"

	@yq '.yay.zsh' packages.yaml | tr -d '[],"' | xargs yay -S --noconfirm
	@yq '.yay.hypr' packages.yaml | tr -d '[],"' | xargs yay -S --noconfirm
	@yq '.yay.fonts' packages.yaml | tr -d '[],"' | xargs yay -S --noconfirm
	@yq '.yay.themes' packages.yaml | tr -d '[],"' | xargs yay -S --noconfirm
	@yq '.yay.apps' packages.yaml | tr -d '[],"' | xargs yay -S --noconfirm

# Debian based distros dependencies
deb-based: deb-emacs-dependencies deb-symlink-dependencies deb-zsh-dependencies construct-path zsh-change-default-shell #deb-docker-dependencies
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

# Operations
construct-path:
	printf "\n${GREEN}-----------CREATING DOTFILES PATH-----------${RESET}"

	mkdir -p ~/Workspaces/Personal && mv ../dotfiles ~/Workspaces/Personal

	printf "${RED}\n-----------ATENTION-----------\n${RESET}"
	printf "${BLUE}The dotfiles repo was moved to the new path ~/Workspaces/Personal/dotfiles\n"
	printf "To further editing this path must be visited${RESET}"
	printf "\n${GREEN}-----------PATH CREATED-----------${RESET}"

zsh-change-default-shell:
	printf "\n${GREEN}-----------CHANGING DEFAULT SHELLL-----------${RESET}"

	chsh -s /usr/bin/zsh

	printf "\n${GREEN}-----------ZSH IS NOW THE DEFAULT SHELL-----------${RESET}"

install-yay:
	printf "\n${GREEN}-----------INSTALING YAY-----------\n${RESET}"

	git clone https://aur.archlinux.org/yay.git
	mv yay/PKGBUILD PKGBUILD
	makepkg -si
	rm -rf yay* pkg src PKGBUILD
	yay -S --noconfirm yq

	printf "\n${GREEN}-----------YAY INSTALATION FINISHED-----------${RESET}"

.SILENT: # this has no purpose but to prevent printfing of commands for all targets
