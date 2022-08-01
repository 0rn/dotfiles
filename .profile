#!/usr/bin/fish
# sourced from ~/.config/fish/config.fish for all user shells

## ALIASES
alias la="ls -A"
alias ll="ls -lAh"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias mvi='mpv --config-dir=$HOME/.config/mvi'

alias dh='du -sh'

alias gl="git log --oneline"
alias gs="git status --short"

alias mix="alsamixer"


# dotfiles repo, maake it a function so that tab completion on 'config add' does not take an age
function config --description 'dotfiles git repo'
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

## PATH
# no / after dir required
# add nim to path
set -ga fish_user_paths /home/hyper/.nimble/bin /home/hyper/.local/bin
# add local libs to path
#set -ga fish_user_paths /usr/local/lib/

## ENVIRONMENT VARIABLES
set -x EDITOR nvim
set -x VISUAL neovide

# make firefox run with wayland when xwayland is installed
set -x MOZ_ENABLE_WAYLAND 1

# make qt apps have the same theme
set -x QT_QPA_PLATFORMTHEME gnome

