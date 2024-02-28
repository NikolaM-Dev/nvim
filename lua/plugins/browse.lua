local bookmarks = {
	nvim_configs = {
		adalessa = 'https://github.com/adalessa/nvim',
		adibhanna = 'https://github.com/adibhanna/nvim',
		cris_at_machine = 'https://github.com/ChristianChiarulli/nvim',
		fbearoff = 'https://github.com/fbearoff/dotfiles/tree/master/nvim/.config/nvim',
		folke = 'https://github.com/folke/dot/tree/master/nvim',
		glepnir = 'https://github.com/glepnir/nvim',
		kickstart = 'https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua',
		lazy_vim = 'https://github.com/LazyVim/LazyVim',
		prime = 'https://github.com/ThePrimeagen/neovimrc',
		wuelner = 'https://github.com/wuelnerdotexe/nvim',
	},
	parq = {
		operator = 'https://main.d2aol8f6bio8ep.amplifyapp.com',
		passes = 'https://main.d2xuop51ekcwbf.amplifyapp.com',
		payvalida_cards = 'https://docs.payvalida.com/api-tarjeta/v/master/tarjetas-de-prueba',
		payvalida_doc = 'https://docs.payvalida.com/documentacion',
		payvalida_sandbox = 'https://sandbox-merchant.payvalida.com/signin',
	},
	awesome = 'https://github.com/rockerBOO/awesome-neovim',
	catppuccin = 'https://github.com/catppuccin/catppuccin',
	dots = 'https://github.com/NikolaM-Dev/dotfiles',
	fontawesome = 'https://fontawesome.com/v5/search?q=car&o=r&m=free',
	fonts = 'https://www.nerdfonts.com/font-downloads',
	icons = 'https://www.nerdfonts.com/cheat-sheet',
	json_escape = 'https://www.freeformatter.com/json-escape.html#before-output',
	json_ts = 'https://transform.tools/json-to-typescript',
	juan_david = 'https://mail.google.com/mail/u/0/#inbox',
	juan = 'https://mail.google.com/mail/u/1/#inbox',
	lazy = 'https://github.com/folke/lazy.nvim',
	lsp = 'https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md',
	new_repository = 'https://github.com/new',
	nikola = 'https://github.com/NikolaM-Dev',
	none_ls = 'https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md',
	reddit = 'https://www.reddit.com/r/neovim',
	refold = 'https://academy.refold.la/library',
	status_codes = 'https://developer.mozilla.org/es/docs/Web/HTTP/Status#errores_de_cliente',
	telescope = 'https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt',
	tokyonight = 'https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors.lua',
	twitch = 'https://www.twitch.tv',
	twitter = 'https://twitter.com/home',
	youtube = 'https://www.youtube.com',
}

return {
	'lalitmee/browse.nvim',
	enabled = false,
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
		require('browse').setup({
			bookmarks = bookmarks,
			icons = {
				bookmark_alias = '',
				bookmarks_prompt = '󰂺 ',
				grouped_bookmarks = '',
			},
		})
	end,
}
