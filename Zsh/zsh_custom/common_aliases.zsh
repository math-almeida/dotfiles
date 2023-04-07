export EDITOR="emacs" # set editor as emacs

alias cp='rsync -a --stats --progress'
alias ls="ls --color=auto" # color to ls
alias l='ls -lah'
alias ghistory="history | grep"
alias isolation="sh ~/Workspaces/Personal/dotfiles/Emacs/run-emacs.sh"
alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"

# Function to create multiple dirs
function mkcd takedir() {
mkdir -p $@ && cd ${@:$#}
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
