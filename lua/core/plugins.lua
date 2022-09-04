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
		open_fn = require('packer.util').float,
		done_sym = '',
		error_sym = '',
		moved_sym = 'ﰳ',
		removed_sym = '',
		working_sym = 'ﰭ',
	},
})

return packer.startup(function(use)
	use('wbthomason/packer.nvim') -- Have packer manage itself

	use('nvim-lua/plenary.nvim') -- Useful lua functions used in lots of plugins
	use('nvim-lua/popup.nvim') -- An implementation of the Popup API from vim in Neovim

	use('nvim-telescope/telescope.nvim') -- About Find, Filter, Preview, Pick. All lua, all the time
	use('nvim-telescope/telescope-file-browser.nvim') -- File Browser extension for telescope
	use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }) -- About FZF sorter for telescope written in c

	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use('nvim-treesitter/nvim-treesitter-context') -- Show code context
	use('nvim-treesitter/nvim-treesitter-textobjects') -- Syntax aware text-objects, select, move, swap, and peek support
	use('JoosepAlviste/nvim-ts-context-commentstring') -- Commentstring based on the cursor location in a file

	use('lewis6991/gitsigns.nvim') -- Git integration for buffers
	use('tpope/vim-fugitive') -- A Git wrapper so awesome, it should be illegal

	use('folke/todo-comments.nvim') -- Highlight, list and search todo comments in your projects
	use('folke/tokyonight.nvim') -- Color scheme for Neovim
	use('glepnir/zephyr-nvim') -- Glepnir color scheme

	-- cmp plugins
	use('hrsh7th/cmp-buffer') -- Buffer completions
	use('hrsh7th/cmp-cmdline') -- Cmdline completions
	use('hrsh7th/cmp-nvim-lsp') -- Lsp completions
	use('hrsh7th/cmp-nvim-lua') -- Lsp comletions for nvim lua
	use('hrsh7th/cmp-path') -- Path completions
	use('hrsh7th/nvim-cmp') -- The completion plugin
	use('saadparwaiz1/cmp_luasnip') -- Snippet completions

	-- snippets
	use('L3MON4D3/LuaSnip') -- Snippet engine
	-- use('rafamadriz/friendly-snippets') -- a bunch of snippets to use

	-- LSP
	use('neovim/nvim-lspconfig') -- Enable LSP
	use('williamboman/nvim-lsp-installer') -- Simple to use language server installer

	-- Treesitter

	use('tpope/vim-commentary') -- Easily comment stuff
	use('kyazdani42/nvim-web-devicons') -- Web devicons
	use('kyazdani42/nvim-tree.lua') -- Tree view for files
	use('lewis6991/impatient.nvim') -- Cache files for faster loading
	use('norcalli/nvim-colorizer.lua') -- Color highlighter
	use('glepnir/galaxyline.nvim') -- Status line
	use('antoinemadec/FixCursorHold.nvim') -- Fix CursorHold Performance
	use('NTBBloodbath/rest.nvim') -- Rest client

	-- Languages
	use('glepnir/mcc.nvim') -- Change your input char to any you want

	use('ThePrimeagen/harpoon')

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
