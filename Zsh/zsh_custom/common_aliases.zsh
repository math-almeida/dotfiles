export EDITOR="emacs" # set editor as emacs

# General Shortcuts
alias cp='rsync -a --stats --progress'
alias ls="ls --color=auto" # color to ls
alias l='ls -lah'
alias ghistory="history | grep"

# Isolate emacs shortcut
alias isolation="sh ~/Workspaces/Personal/dotfiles/Emacs/run-emacs.sh"

# Update shortcuts
alias dupdate="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias pupdate="yes | sudo pacman -Syu"

# Vpn shortcuts
alias tailstatus="tailscale status"
