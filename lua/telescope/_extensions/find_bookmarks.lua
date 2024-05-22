local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local conf = require('telescope.config').values
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')

---Get the domain of a URL
---Example: https://obsidian.md => obsidian.md
---@param url string: URL to which your domain will be extracted
---@return string: Domain from the URL
local function get_domain(url)
	return string.match(url, 'https?://([^/]+)')
end

local function get_results(bookmarks)
	local bookmarks_copy = vim.deepcopy(bookmarks or {})
	local results = {}

	for k, v in pairs(bookmarks_copy) do
		if type(k) == 'string' then
			table.insert(results, { k, v })
		else
			table.insert(results, v)
		end
	end

	return results
end

local function get_entry_marker(entry)
	local value, display, ordinal

	if type(entry) == 'string' then
		value = entry
		display = entry
		ordinal = entry
	elseif type(entry) == 'table' and type(entry[2]) ~= 'table' then
		value = entry[2]
		display = entry[1] .. ' ' .. '' .. ' ' .. value
		ordinal = entry[1] .. entry[2]
	elseif type(entry) == 'table' and type(entry[2]) == 'table' then
		display = entry[1] .. ' ' .. ''
		ordinal = entry[1]

		for k, v in pairs(entry[2]) do
			ordinal = ordinal .. k .. v

			if type(k) == 'string' then
				display = display .. ' ' .. k
			else
				display = display .. ' ' .. get_domain(v)
			end
		end

		value = entry[2]
		display = display
		ordinal = ordinal
	end

	return {
		value = value,
		display = display,
		ordinal = ordinal,
	}
end

---@return function
local function get_find_bookmarks()
	local bookmarks = {
		nvim_configs = {
			adalessa = 'https://github.com/adalessa/nvim',
			adibhanna = 'https://github.com/adibhanna/nvim',
			cris_at_machine = 'https://github.com/ChristianChiarulli/nvim',
			dcrag = 'https://github.com/CRAG666/dotfiles/tree/main/config/nvim',
			epwalsh = 'https://github.com/epwalsh/dotfiles/tree/main/neovim',
			fbearoff = 'https://github.com/fbearoff/dotfiles/tree/master/nvim/.config/nvim',
			folke = 'https://github.com/folke/dot/tree/master/nvim',
			glepnir = 'https://github.com/glepnir/nvim',
			kickstart = 'https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua',
			lazy_vim = 'https://github.com/LazyVim/LazyVim',
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
		obsidian = 'https://github.com/epwalsh/obsidian.nvim',
		random_wheel = 'https://es.piliapp.com/random/wheel/',
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

	local bookmarks_fallback = vim.deepcopy(bookmarks)

	local function find_bookmarks(opts)
		opts = opts or {}

		pickers
			.new(opts, {
				prompt_title = ' 󰸕 Bookmakrs ',
				finder = finders.new_table({
					results = get_results(bookmarks),
					entry_maker = get_entry_marker,
				}),
				sorter = conf.generic_sorter(opts),
				attach_mappings = function(prompt_bufnr)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)

						local value = action_state.get_selected_entry().value

						if type(value) == 'string' then
							vim.notify(string.format('Opening %s', value), vim.log.levels.INFO)
							vim.fn.jobstart({ 'brave', value })

							bookmarks = bookmarks_fallback

							return
						end

						bookmarks = value

						find_bookmarks(opts)
					end)

					return true
				end,
			})
			:find()
	end

	return find_bookmarks
end

return require('telescope').register_extension({
	exports = {
		find_bookmarks = get_find_bookmarks(),
	},
})
