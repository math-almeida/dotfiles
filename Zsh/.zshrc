# If ZSH_DOTFILES is not defined, use the current script's directory
[[ -z "$ZSH_DOTFILES" ]] && export ZSH_DOTFILES="${${(%):-%x}:a:h}"

if [ ! -d ~/.zplug ]; then
  echo "zplug is not installed, installing..."
  git clone https://github.com/zplug/zplug ~/.zplug
fi

# Init zplug
source ~/.zplug/init.zsh

# Custom Plugins
source "$ZSH_DOTFILES/zsh_custom/common_aliases.zsh"
source "$ZSH_DOTFILES/zsh_custom/docker.plugin.zsh"
source "$ZSH_DOTFILES/zsh_custom/common_paths.zsh"

# Zplug plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2 
zplug "zsh-users/zsh-autosuggestions" 
zplug "zsh-users/zsh-completions" 

# Oh-my-zsh

## I really like Oh-My-Zsh config but I cut unnecessary things and replace others.

## Libs
libs=(
  clipboard.zsh
  completion.zsh
  correction.zsh
  directories.zsh
  git.zsh
  grep.zsh
  history.zsh
  key-bindings.zsh
  misc.zsh
  nvm.zsh
  prompt_info_functions.zsh
  spectrum.zsh
  termsupport.zsh
  theme-and-appearance.zsh
  vcs_info.zsh
)

## Plugins
plugins=(
    vi-mode
    asdf
    git
    ruby
)

for lib in "${libs[@]}"; do
  zplug "ohmyzsh/ohmyzsh", use:"lib/$lib"
done

for plugin in "${plugins[@]}"; do
  zplug "ohmyzsh/ohmyzsh", use:"plugins/$plugin"
done

## Theme
zplug "ohmyzsh/ohmyzsh", use:"themes/half-life.zsh-theme", as:theme 

zplug install # Install all things
zplug load # load zplug
