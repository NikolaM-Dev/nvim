return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'NikolaM-Dev/nvim-base16.lua' -- Themes
  use 'kyazdani42/nvim-web-devicons' -- Web devicons
  use 'kyazdani42/nvim-tree.lua' -- File explorer
  use 'nvim-lualine/lualine.nvim' -- Status line
  use 'romgrk/barbar.nvim' -- Buffers bar
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- TreeSitter
  use 'p00f/nvim-ts-rainbow' -- Bracket pairs
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  } -- Fuzzy finder

  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'onsails/lspkind.nvim' -- Pictograms for LSP symbols
end)
