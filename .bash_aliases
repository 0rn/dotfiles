# flatpak version of nvim
alias nvim="flatpak run io.neovim.nvim"

alias v="nvim"
alias clip="xclip -sel clip"
alias c="xclip -sel clip"

# dotfiles repo
alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias src="source ~/.bashrc"

alias cs="config status --untracked-files=no --short"
