local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	print('Installing packer close and reopen Neovim...')
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		working_sym = 'ﰭ',
		error_sym = '',
		done_sym = '',
		removed_sym = '',
		moved_sym = 'ﰳ',
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end,
	},
})

return packer.startup(function(use)
	use('wbthomason/packer.nvim') -- Have packer manage itself

	use('nvim-lua/plenary.nvim') -- Useful lua functions used in lots of plugins
	use('nvim-lua/popup.nvim') -- An implementation of the Popup API from vim in Neovim

	use('folke/tokyonight.nvim') -- color scheme for Neovim

	-- cmp plugins
	use('hrsh7th/cmp-buffer') -- buffer completions
	use('hrsh7th/cmp-cmdline') -- cmdline completions
	use('hrsh7th/cmp-nvim-lsp') -- lsp completions
	use('hrsh7th/cmp-nvim-lua') -- lsp comletions for nvim lua
	use('hrsh7th/cmp-path') -- path completions
	use('hrsh7th/nvim-cmp') -- The completion plugin
	use('saadparwaiz1/cmp_luasnip') -- snippet completions

	-- snippets
	use('L3MON4D3/LuaSnip') --snippet engine
	-- use('rafamadriz/friendly-snippets') -- a bunch of snippets to use

	-- LSP
	use('neovim/nvim-lspconfig') -- enable LSP
	use('williamboman/nvim-lsp-installer') -- simple to use language server installer
	-- use('tamago324/nlsp-settings.nvim') -- language server settings defined in json for
	-- use('jose-elias-alvarez/null-ls.nvim') -- for formatters and linters

	-- Telescope
	use('nvim-telescope/telescope.nvim')

	-- Treesitter
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	})
	use('JoosepAlviste/nvim-ts-context-commentstring') -- setting the commentstring based on the cursor location in a file

	-- Git
	use('lewis6991/gitsigns.nvim')

	-- Utilities
	use('windwp/nvim-autopairs') -- Autopairs, integrates with both cmp and treesitter
	use('numToStr/Comment.nvim') -- Easily comment stuff
	use('kyazdani42/nvim-web-devicons') -- Web devicons
	use('kyazdani42/nvim-tree.lua') -- Tree view for files
	use('lewis6991/impatient.nvim') -- Cache files for faster loading

	-- use('akinsho/bufferline.nvim')
	-- use('moll/vim-bbye')
	-- use('nvim-lualine/lualine.nvim')
	-- use('akinsho/toggleterm.nvim')
	-- use('ahmedkhalf/project.nvim')
	-- use('lukas-reineke/indent-blankline.nvim')
	-- use('goolord/alpha-nvim')
	-- use('antoinemadec/FixCursorHold.nvim') -- This is needed to fix lsp doc highlight

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
