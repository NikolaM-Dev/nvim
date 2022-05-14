return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'NikolaM-Dev/nvim-base16.lua' -- Themes
  use 'kyazdani42/nvim-web-devicons' -- Web devicons
  use 'kyazdani42/nvim-tree.lua' -- File explorer
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
end)
