local bookmarks = {
	'https://docs.payvalida.com/documentacion',
	'https://github.com/adalessa/dotfiles/tree/main/nvim/.config/nvim',
	'https://github.com/ChristianChiarulli/nvim',
	'https://github.com/folke/dot',
	'https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors.lua',
	'https://github.com/glepnir/nvim',
	'https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md',
	'https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md',
	'https://github.com/NikolaM-Dev',
	'https://github.com/NikolaM-Dev/dotfiles',
	'https://github.com/rockerBOO/awesome-neovim',
	'https://github.com/ThePrimeagen/init.lua',
	'https://mail.google.com/mail/u/0/#inbox',
	'https://mail.google.com/mail/u/1/#inbox',
	'https://main.d2xuop51ekcwbf.amplifyapp.com',
	'https://twitter.com/home',
	'https://www.twitch.tv',
	'https://www.youtube.com',
}

return {
	'lalitmee/browse.nvim',
	keys = {
		{
			'<leader>bb',
			function()
				require('browse').open_bookmarks({ bookmarks = bookmarks })
			end,
		},
	},
	config = function()
		require('browse').setup()
	end,
}
