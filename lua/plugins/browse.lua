-- TODO: Add grouped urls
local bookmarks = {
	nvim_configs = {
		adalessa = 'https://github.com/adalessa/nvim',
		adibhanna = 'https://github.com/adibhanna/nvim',
		cris_at_machine = 'https://github.com/ChristianChiarulli/nvim',
		fbearoff = 'https://github.com/fbearoff/dotfiles/tree/master/nvim/.config/nvim',
		folke = 'https://github.com/folke/dot/tree/master/nvim',
		glepnir = 'https://github.com/glepnir/nvim',
		prime = 'https://github.com/ThePrimeagen/init.lua',
		wuelner = 'https://github.com/wuelnerdotexe/nvim',
	},
	nvim = {
		lsp = 'https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md',
		null_ls = 'https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md',
		reddit = 'https://www.reddit.com/r/neovim',
		telescope = 'https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt',
		awesome = 'https://github.com/rockerBOO/awesome-neovim',
		lazy = 'https://github.com/folke/lazy.nvim',
		lazy_vim = 'https://github.com/LazyVim/LazyVim',
		tokyonight = 'https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors.lua',
	},
	github = {
		new_repo = 'https://github.com/new',
		notifications = 'https://github.com/notifications',
	},
	parq = {
		passes = 'https://main.d2xuop51ekcwbf.amplifyapp.com',
		payvalida_doc = 'https://docs.payvalida.com/documentacion',
		payvalida_sandbox = 'https://sandbox-merchant.payvalida.com/signin',
	},
	utils = {
		fonts = 'https://www.nerdfonts.com/font-downloads',
		http = 'https://developer.mozilla.org/es/docs/Web/HTTP/Status',
		icons = 'https://www.nerdfonts.com/cheat-sheet',
		json_escape = 'https://www.freeformatter.com/json-escape.html#before-output',
		json_ts = 'https://transform.tools/json-to-typescript',
	},
	catppuccin = 'https://github.com/catppuccin/catppuccin',
	dots = 'https://github.com/NikolaM-Dev/dotfiles',
	juan_david = 'https://mail.google.com/mail/u/0/#inbox',
	juan = 'https://mail.google.com/mail/u/1/#inbox',
	nikola = 'https://github.com/NikolaM-Dev',
	twitch = 'https://www.twitch.tv',
	twitter = 'https://twitter.com/home',
	youtube = 'https://www.youtube.com',
}

return {
	'lalitmee/browse.nvim',
	keys = {
		{
			'<leader>bb',
			function()
				require('browse').open_bookmarks({ bookmarks = bookmarks })
			end,
			desc = '[B]rowse [B]ookmarks',
		},
	},
	config = function()
		require('browse').setup({ bookmarks = bookmarks })
	end,
}
