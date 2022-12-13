local status_ok, browse = pcall(require, 'browse')
if not status_ok then
	return
end

local keymap = require('core.keymap')

local nmap = keymap.nmap
local noremap = keymap.noremap
local opts = keymap.new_opts

browse.setup({
	-- search provider you want to use
	provider = 'google', -- default
})

local bookmarks = {
	'https://github.com/adalessa/dotfiles/tree/main/nvim/.config/nvim',
	'https://github.com/ChristianChiarulli/nvim',
	'https://github.com/glepnir/nvim',
	'https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md',
	'https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md',
	'https://github.com/NikolaM-Dev',
	'https://github.com/NikolaM-Dev/dotfiles',
	'https://github.com/rockerBOO/awesome-neovim',
	'https://github.com/ThePrimeagen/init.lua',
	'https://mail.google.com/mail/u/0/#inbox',
	'https://mail.google.com/mail/u/1/#inbox',
	'https://twitter.com/home',
	'https://www.twitch.tv',
	'https://www.youtube.com',
}

nmap({
	{
		'<leader>bb',
		function()
			browse.open_bookmarks({ bookmarks = bookmarks })
		end,
		opts(noremap),
	},
	{
		'<leader>bf',
		function()
			browse.input_search()
		end,
		opts(noremap),
	},
	{
		'<leader>bm',
		function()
			browse.mdn.search()
		end,
		opts(noremap),
	},
	{
		'<leader>bd',
		function()
			browse.devdocs.search_with_filetype()
		end,
		opts(noremap),
	},
})
