local M = {}

---@type table
local bookmarks = {
	nvim_configs = {
		adalessa = 'https://github.com/adalessa/nvim',
		adibhanna = 'https://github.com/adibhanna/nvim',
		b0o = 'https://github.com/b0o/nvim-conf',
		cris_at_machine = 'https://github.com/ChristianChiarulli/nvim',
		dcrag = 'https://github.com/CRAG666/dotfiles/tree/main/config/nvim',
		epwalsh = 'https://github.com/epwalsh/dotfiles/tree/main/neovim',
		fbearoff = 'https://github.com/fbearoff/dotfiles/tree/master/nvim/.config/nvim',
		folke = 'https://github.com/folke/dot/tree/master/nvim',
		glepnir = 'https://github.com/glepnir/nvim',
		kickstart = 'https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua',
		lazy_vim = 'https://github.com/LazyVim/LazyVim',
		linkarzu = 'https://github.com/linkarzu/dotfiles-latest/blob/main/neovim/neobean',
		mrs4ndman = 'https://github.com/mrs4ndman/nvim-conf',
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
	concentration = 'https://www.youtube.com/watch?v=yLUqkgpSw7Y&list=PLyjmPWCWfM3LJDpmmnJj6U7ot4Q1grdPO&index=7',
	contentoso = 'https://www.youtube.com/watch?v=ja75uBnzHS0',
	dots = 'https://github.com/NikolaM-Dev/dotfiles',
	fontawesome = 'https://fontawesome.com/v5/search?q=car&o=r&m=free',
	fonts = 'https://www.nerdfonts.com/font-downloads',
	icons = 'https://www.nerdfonts.com/cheat-sheet',
	json_escape = 'https://www.freeformatter.com/json-escape.html#before-output',
	json_ts = 'https://transform.tools/json-to-typescript',
	juan_david = 'https://mail.google.com/mail/u/0/#inbox',
	juan = 'https://mail.google.com/mail/u/1/#inbox',
	lazy = 'https://lazy.folke.io/spec',
	lsp = 'https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md',
	music = 'https://www.youtube.com/watch?v=1gSe78TIEEk&list=PLyjmPWCWfM3LJDpmmnJj6U7ot4Q1grdPO',
	new_repository = 'https://github.com/new',
	nikola = 'https://github.com/NikolaM-Dev',
	none_ls = 'https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md',
	obsidian = 'https://github.com/epwalsh/obsidian.nvim',
	random_wheel = 'https://es.piliapp.com/random/wheel',
	reddit = 'https://www.reddit.com/r/neovim',
	refold = 'https://academy.refold.la/library',
	sesh = 'https://github.com/joshmedeski/sesh',
	status_codes = 'https://developer.mozilla.org/es/docs/Web/HTTP/Status#errores_de_cliente',
	telescope = 'https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt',
	tokyonight = 'https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors.lua',
	twitch = 'https://www.twitch.tv',
	twitter = 'https://twitter.com/home',
	youtube = 'https://www.youtube.com',
}

---Retuns the bookmarks table to browse.nvim
---@return table
function M.get_bookmarks()
	return bookmarks
end

return M
