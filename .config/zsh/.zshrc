# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chris/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
### ZSH INIT
prompt="%F{green}%n@%m%k %B%F{cyan}%(4~|...|)%3~%F{white} ~ "

alias ls="ls --color --group-directories-first"
alias la="ls -vA"
alias ll="ls -o"
alias lla="ll -vA"

# git aliases
alias gs="git status --short"
alias gl="git log --oneline"

alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# refresh timestamp on each use of sudo
alias sudo="sudo -v; sudo"

# add sudo to commands that need it (pacman usually does)
alias pacman="sudo pacman"
alias shutdown="shutdown now"
#alias reboot="sudo reboot"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"
export EDITOR="nvim"

# nnn aliases and exports
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"
export NNN_PLUG="f:fzcd;o:fzopen;p:preview-tui;d:dragdrop"
#                   c1e2272e006033f7c6d6abc4
export NNN_FCOLORS="0000E6310000000000000000"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_TERMINAL="footclient"
alias nnn="GUI=1 nnn -c"

alias mvi="mpv -profile image"

alias sourcerc="source $ZDOTDIR/.zshrc"

# styling for qt
export QT_SCALE_FACTOR=1.5
export QT_STYLE_OVERRIDE=adwaita-dark

# User env
export MOZ_ENABLE_WAYLAND=1

# PATH
export PATH="$PATH:$HOME/.nimble/bin:$HOME/.local/bin"

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
_fzf_compgen_path() {
    fd --follow . "$1"
}
_fzf_compgen_dir() {
    fd --type d --follow . "$1"
}
