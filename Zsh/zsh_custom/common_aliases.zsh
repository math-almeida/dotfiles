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
function tailstart() {
    sudo tailscale up --accept-routes
    echo "Tailscale started successfully"
}

function tailstop() {
    sudo tailscale down
    echo "Tailscale stoped"
}

# Function for zsh statistics about more used commands
function zsh_stats() {
  fc -l 1 \
    | awk '{ CMD[$2]++; count++; } END { for (a in CMD) print CMD[a] " " CMD[a]*100/count "% " a }' \
    | grep -v "./" | sort -nr | head -20 | column -c3 -s " " -t | nl
}

# Function to download and decompress a file from a url
function takeurl() {
  local data thedir
  data="$(mktemp)"
  curl -L "$1" > "$data"
  tar xf "$data"
  thedir="$(tar tf "$data" | head -1)"
  rm "$data"
  cd "$thedir"
}

# Function to clone repos and navigate to him
function takegit() {
  git clone "$1"
  cd "$(basename ${1%%.git})"
}

# Function to create multiple dirs
function mkcd takedir() {
mkdir -p $@ && cd ${@:$#}
}

# Function wrapper to use the other functions based on regex
function take() {
  if [[ $1 =~ ^(https?|ftp).*\.tar\.(gz|bz2|xz)$ ]]; then
    takeurl "$1"
  elif [[ $1 =~ ^([A-Za-z0-9]\+@|https?|git|ssh|ftps?|rsync).*\.git/?$ ]]; then
    takegit "$1"
  else
    takedir "$@"
  fi
}

# Function to run cargo with especific environment file
function cargoenv() {
    if ! command -v dotenv &> /dev/null; then
	echo "Error: 'dotenv' is not installed. Please install it to run this command."
	exit 1
    fi

    if ! command -v cargo &> /dev/null; then
	echo "Error: 'cargo' is not installed. Please install it to run this command."
	exit 1
    fi

    echo "Running cargo $2 with $1 env file"
    dotenv -e "$1" -- cargo "$2"
}
