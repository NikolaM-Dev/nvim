local bookmarks = {
	parq = {
		passes = 'https://main.d2xuop51ekcwbf.amplifyapp.com',
		payvalida_doc = 'https://docs.payvalida.com/documentacion',
		payvalida_sandbox = 'https://sandbox-merchant.payvalida.com/signin',
	},
	adalessa = 'https://github.com/adalessa/nvim',
	adibhanna = 'https://github.com/adibhanna/nvim',
	awesome = 'https://github.com/rockerBOO/awesome-neovim',
	catppuccin = 'https://github.com/catppuccin/catppuccin',
	cris_at_machine = 'https://github.com/ChristianChiarulli/nvim',
	dots = 'https://github.com/NikolaM-Dev/dotfiles',
	fbearoff = 'https://github.com/fbearoff/dotfiles/tree/master/nvim/.config/nvim',
	folke = 'https://github.com/folke/dot/tree/master/nvim',
	fontawesome = 'https://fontawesome.com/v5/search?q=car&o=r&m=free',
	fonts = 'https://www.nerdfonts.com/font-downloads',
	glepnir = 'https://github.com/glepnir/nvim',
	icons = 'https://www.nerdfonts.com/cheat-sheet',
	json_escape = 'https://www.freeformatter.com/json-escape.html#before-output',
	json_ts = 'https://transform.tools/json-to-typescript',
	juan_david = 'https://mail.google.com/mail/u/0/#inbox',
	juan = 'https://mail.google.com/mail/u/1/#inbox',
	lazy = 'https://github.com/folke/lazy.nvim',
	lazy_vim = 'https://github.com/LazyVim/LazyVim',
	lsp = 'https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md',
	new_repository = 'https://github.com/new',
	nikola = 'https://github.com/NikolaM-Dev',
	null_ls = 'https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md',
	prime = 'https://github.com/ThePrimeagen/init.lua',
	reddit = 'https://www.reddit.com/r/neovim',
	refold = 'https://academy.refold.la/library',
	status_codes = 'https://developer.mozilla.org/es/docs/Web/HTTP/Status',
	telescope = 'https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt',
	tokyonight = 'https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors.lua',
	twitch = 'https://www.twitch.tv',
	twitter = 'https://twitter.com/home',
	wuelner = 'https://github.com/wuelnerdotexe/nvim',
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
