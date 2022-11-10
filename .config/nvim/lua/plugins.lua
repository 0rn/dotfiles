return require( "packer" ).startup( function( use )
  use "wbthomason/packer.nvim"        -- | Plugin Manager

  -- Language Tools --------------------------------------------------
  use "neovim/nvim-lspconfig"         -- | Default config for NeoVim lsp
  use "williamboman/mason.nvim"

  use "hrsh7th/cmp-nvim-lsp"          -- | LSP source for nvim-cmp
  use "hrsh7th/cmp-buffer"            -- | In buffer completion
  use "hrsh7th/cmp-path"              -- | Path comp
  use "hrsh7th/cmp-cmdline"           -- | Command line comp
  use "hrsh7th/nvim-cmp"              -- | Autocompletion plugin

  use "L3MON4D3/LuaSnip"              -- | Snippets plugin
  use "saadparwaiz1/cmp_luasnip"      -- | Snippets source for nvim-cmp

  --use "~/devel/nvim/nim_syntax"      -- | Syntax highlight for Nim
  use "alaviss/nim.nvim"
  use "jakwings/vim-terra"            -- | Support for terralang
  use "bfrg/vim-cpp-modern"           -- | Better c++ syntax
  use "nickeb96/fish.vim"             -- | Fish shell language support

  -- Interface & Colorschemes ----------------------------------------
  use "nvim-lualine/lualine.nvim"     -- | Status line
  use "norcalli/nvim-colorizer.lua"   -- | Highlight colours and hex codes
  use "morhetz/gruvbox"
  use "whatyouhide/vim-gotham"
  use "dracula/vim"
  use "jacoborus/tender"
  use "arcticicestudio/nord-vim"
  use "nanotech/jellybeans.vim"
  use "drewtempelmeyer/palenight.vim"
  use "catppuccin/nvim"

  use "rebelot/kanagawa.nvim"
  --use "~/devel/nvim/silksong"


  -- Tools -----------------------------------------------------------
  use "folke/which-key.nvim"          -- | Helps to learn vim keybinds
  use "nvim-telescope/telescope.nvim" -- | Fuzzy finder
  use "nvim-lua/plenary.nvim"         -- | Dependenty for telescope

end )


