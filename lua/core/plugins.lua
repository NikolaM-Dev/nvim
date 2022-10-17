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
		done_sym = '',
		error_sym = '',
		moved_sym = 'ﰳ',
		removed_sym = '',
		working_sym = 'ﰭ',
	},
	max_jobs = 20,
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

	use('neovim/nvim-lspconfig') -- Configurations for Nvim LSP
	use('williamboman/mason.nvim') -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
	use('williamboman/mason-lspconfig.nvim') -- That makes it easier to use lspconfig with mason.nvim
	use('glepnir/lspsaga.nvim') -- Lsp puglin by glepnir
	use('https://git.sr.ht/~whynothugo/lsp_lines.nvim') -- Renders diagnostics using virtual lines on top of the real line of cod

	use('hrsh7th/cmp-buffer') -- Buffer completions
	use('hrsh7th/cmp-calc') -- Source for math calculation
	use('hrsh7th/cmp-cmdline') -- Cmdline completions
	use('hrsh7th/cmp-nvim-lsp') -- Lsp completions
	use('hrsh7th/cmp-nvim-lsp-signature-help') -- signature-help
	use('hrsh7th/cmp-nvim-lua') -- Lsp comletions for nvim lua
	use('hrsh7th/cmp-path') -- Path completions
	use('hrsh7th/nvim-cmp') -- The completion plugin
	use('L3MON4D3/LuaSnip') -- Snippet engine
	use('saadparwaiz1/cmp_luasnip') -- Snippet completions

	use('windwp/nvim-autopairs') -- Autopairs
	use('windwp/nvim-ts-autotag') -- Use treesitter to auto close and auto rename html tag

	use('lewis6991/gitsigns.nvim') -- Git integration for buffers
	use('tpope/vim-fugitive') -- A Git wrapper so awesome, it should be illegal
	use('sindrets/diffview.nvim') -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.

	use('folke/todo-comments.nvim') -- Highlight, list and search todo comments in your projects
	use('folke/tokyonight.nvim') -- Color scheme for Neovim
	use('glepnir/galaxyline.nvim') -- Status line
	use('kyazdani42/nvim-tree.lua') -- Tree view for files
	use('kyazdani42/nvim-web-devicons') -- Web devicons
	use('NvChad/nvim-colorizer.lua') -- Color highlighter
	use('folke/trouble.nvim') -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
	use('antoinemadec/FixCursorHold.nvim') -- Fix CursorHold Performance
	use('glepnir/mcc.nvim') -- Change your input char to any you want
	use('lewis6991/impatient.nvim') -- Cache files for faster loading
	use('NTBBloodbath/rest.nvim') -- Rest client
	use('ThePrimeagen/harpoon') -- ThePrimagen tool for productivie in files
	use('jose-elias-alvarez/null-ls.nvim') -- Inject LSP diagnostics, code actions, and more via Lua
	use('mbbill/undotree') -- The undo history visualizer for VIM
	use('max397574/better-escape.nvim') -- Escape from insert mode without delay when typing
	use({ 'phaazon/hop.nvim', branch = 'v2' }) -- Neovim motions on speed!
	use({ 'iamcco/markdown-preview.nvim', ft = 'markdown', run = 'cd app && yarn install' }) -- Markdown preview
	use('fedepujol/move.nvim') -- Gain the power to move lines and blocks and auto-indent them
	use('folke/zen-mode.nvim') -- Clean and elegant distraction-free writing for NeoVim
	use('lalitmee/browse.nvim') -- Browse for anything using your choice of method
	use('stevearc/dressing.nvim') -- Neovim plugin to improve the default vim.ui interfaces
	use('mg979/vim-visual-multi') -- Multi cursor
	use('potamides/pantran.nvim') -- Use your favorite machine translation engines without having to leave your favorite editor
	use('tpope/vim-surround') -- Delete/change/add parentheses/quotes/XML-tags/much more with ease
	use('tpope/vim-repeat') -- Enable repeating supported plugin maps with "."
	use('AckslD/nvim-neoclip.lua') -- Clipboard manager neovim plugin with telescope integration
	use({ 'kkharji/sqlite.lua', module = 'sqlite' }) -- SQLite LuaJIT binding with a very simple api
	use('p00f/nvim-ts-rainbow') -- Rainbow parentheses for neovim using tree-sitter
	use('aserowy/tmux.nvim') -- About tmux integration for nvim features pane movement and resizing
	use('echasnovski/mini.nvim') -- Automatic highlighting of word under cursor

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
