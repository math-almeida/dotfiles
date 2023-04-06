build: emacs-dependencies symlink-dependencies construct-path zsh-change-default-shell
	ruby symlinks.rb
	echo ""
	echo "-----------INSTALATION FINISHED-----------"
.PHONY:build

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
	chsh -s $(which zsh)
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
	sudo apt install build-essencial zlib1g-dev libyaml-dev libssl-dev
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
	asdf plugin-add ruby && asdf install ruby latest && asdf global ruby latest
	echo "-----------SYMLINK DEPENDENCIES FINISHED-----------"
.PHONY:symlink-dependencies

emacs-dependencies:
	echo "-----------INSTALING EMACS DEPENDENCIES-----------"
	echo ""
	sudo apt install fonts-firacode fonts-cantarell silversearcher-ag cmake libvterm-dev emacs
	echo "-----------EMACS DEPENDENCIES FINISHED-----------"
.PHONY:emacs-dependencies

.SILENT: # this has no purpose but to prevent echoing of commands for all targets
