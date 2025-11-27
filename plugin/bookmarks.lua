---Get bookmarks in a flattened table
---@return table<string, string>|table<string, table<string, string>>
local function get_bookmarks()
	---@type string[]
	local bookmarks = {}

	---@type table<string, string>|table<string, table<string, string>>
	local grouped_bookmarks = {
		nvim = {
			['adibhanna'] = 'https://github.com/adibhanna/nvim',
			['alpha new'] = 'https://github.com/adalessa/alpha-nvim/tree/main',
			['alpha old'] = 'https://gitea.ad-impeldown.synology.me/alpha/nixvim/src/branch/main',
			['b0o'] = 'https://github.com/b0o/nvim-conf',
			['backup'] = 'https://github.com/NikolaM-Dev/nvim/tree/backup',
			['chris at machine'] = 'https://github.com/ChristianChiarulli/nvim',
			['chris'] = 'https://github.com/chrisgrieser/.config/tree/main/nvim',
			['dcrag'] = 'https://github.com/CRAG666/dotfiles/tree/main/config/nvim',
			['epwalsh'] = 'https://github.com/epwalsh/dotfiles/tree/main/neovim',
			['fbearoff'] = 'https://github.com/fbearoff/dotfiles/tree/master/nvim/.config/nvim',
			['folke'] = 'https://github.com/folke/dot/tree/master/nvim',
			['glepnir'] = 'https://github.com/glepnir/nvim',
			['kickstart'] = 'https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua',
			['lazyVim'] = 'https://github.com/LazyVim/LazyVim',
			['linkarzu'] = 'https://github.com/linkarzu/dotfiles-latest/blob/main/neovim/neobean',
			['mrs4ndman'] = 'https://github.com/mrs4ndman/nvim-conf',
			['prime'] = 'https://github.com/ThePrimeagen/init.lua',
			['wuelner'] = 'https://github.com/wuelnerdotexe/nvim',
		},

		docs = {
			['bash'] = 'https://devhints.io/bash',
			['maple'] = 'https://github.com/subframe7536/maple-font/blob/variable/source/features/README.md',
			['obsidian'] = 'https://docs.obsidian.md/Home',
			['snacks'] = 'https://github.com/folke/snacks.nvim/blob/main/README.md',
		},

		youtube = {
			['history'] = 'https://www.youtube.com/feed/history',
			['playlists'] = 'https://www.youtube.com/feed/playlists',
			['wl'] = 'https://www.youtube.com/playlist?list=WL',
		},

		motivation = {
			['contentoso'] = 'https://www.youtube.com/watch?v=ja75uBnzHS0',
			['discipline'] = 'https://www.youtube.com/@DailyDisciplineraw/videos',
			['gods'] = 'https://www.youtube.com/watch?v=C3GouGa0noM',
			['mathhew'] = 'https://www.youtube.com/watch?v=QbL0X3B4mjg',
		},

		lua = {
			['annotations'] = 'https://github.com/LuaLS/lua-language-server/wiki/Annotations',
		},

		['zen browser'] = {
			['releases'] = 'https://github.com/zen-browser/desktop/releases',
		},

		['good doctor'] = 'https://repelisplus.lat/ver/the-good-doctor-aag-kmar',

		['carpal tunnel'] = 'https://youtu.be/sfVIl4uHrnQ',

		['lute docs'] = 'https://luteorg.github.io/lute-manual',
		['lute read'] = 'http://localhost:1873',

		['notes devops'] = 'https://www.youtube.com/@mischavandenburg',
		['notes data scientist'] = 'https://www.youtube.com/@sspaeti',
		['notes zk'] = 'https://github.com/zk-org/zk',
		['notes zk.nvim'] = 'https://github.com/zk-org/zk-nvim',

		['raining in japan'] = 'https://youtu.be/Vg13S-zzol0',

		americanipachart = 'https://americanipachart.com',
		cambridge = 'https://dictionary.cambridge.org/dictionary/english',
		ipachart = 'https://www.ipachart.com',

		awesome = 'https://github.com/rockerBOO/awesome-neovim',
		bun = 'https://bun.sh/guides',
		catppuccin = 'https://github.com/catppuccin/catppuccin',
		concentration = 'https://www.youtube.com/watch?v=yLUqkgpSw7Y',
		dots = 'https://github.com/NikolaM-Dev/dotfiles',
		fast = 'https://fast.com',
		fontawesome = 'https://fontawesome.com/v5/search?q=car&o=r&m=free',
		fonts = 'https://www.nerdfonts.com/font-downloads',
		icons = 'https://www.nerdfonts.com/cheat-sheet',
		json_escape = 'https://www.freeformatter.com/json-escape.html#before-output',
		json_ts = 'https://transform.tools/json-to-typescript',
		juan_david = 'https://mail.google.com/mail/u/0/#inbox',
		juan = 'https://mail.google.com/mail/u/1/#inbox',
		lazy = 'https://lazy.folke.io/spec',
		lsp = 'https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md',
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
		transcriptions = 'https://notegpt.io/youtube-transcript-generator',
		twitch = 'https://www.twitch.tv',
		twitter = 'https://twitter.com/home',
	}

	vim.iter(grouped_bookmarks):each(function(label, bookmark)
		if type(label) == 'number' then
			vim.notify('Every bookmark must be labeled or grouped', vim.log.levels.ERROR, { title = 'Browse' })

			return
		end

		if type(bookmark) == 'string' then
			bookmarks[label] = bookmark

			return
		end

		if type(bookmark) == 'table' then
			local sub_bookmarks = bookmark
			for raw_label, sub_bookmark in pairs(sub_bookmarks) do
				local sub_label = label .. ' ' .. raw_label

				bookmarks[sub_label] = sub_bookmark
			end
		end
	end)

	return bookmarks
end

---Find and open a bookmark in your default browser
local function browse_bookmarks()
	require('snacks').picker.pick({
		layout = 'select',
		preview = 'none',
		title = '  Bookmarks ',

		items = vim.iter(get_bookmarks())
			:map(function(label, bookmark)
				return {
					text = label,
					value = bookmark,
				}
			end)
			:totable(),

		confirm = function(picker, item)
			picker:close()

			if item then
				vim.ui.open(item.value)
			end
		end,

		format = function(item)
			return {
				{ item.text, '@lsp.type.variable' },
			}
		end,
	})
end

nkl.key.map('n', '<leader>bb', function()
	browse_bookmarks()
end, { desc = '[B]rowse [B]ookmarks' })
