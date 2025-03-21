---@type LazySpec
return {
	'nvim-lualine/lualine.nvim',
	enabled = true,

	event = 'VeryLazy',

	config = function()
		local COLORS = {
			blue = '#89b4fa',
			lavender = '#b4befe',
			mauve = '#cba6f7',
			overlay0 = '#6c7086',
			sapphire = '#74c7ec',
			text = '#cdd6f4',
			transparent = '',
		}

		local function word_count()
			return tostring(vim.fn.wordcount().words) .. ' words'
		end

		local function reading_time()
			local MINS_IN_HOUR = 60
			local reading_time_in_mins = math.ceil(vim.fn.wordcount().words / 200)

			if reading_time_in_mins < MINS_IN_HOUR then
				return tostring(reading_time_in_mins) .. ' mins'
			end

			local hours = math.floor(reading_time_in_mins / MINS_IN_HOUR)
			local minutes = reading_time_in_mins % MINS_IN_HOUR

			return tostring(hours) .. ' hrs ' .. tostring(minutes) .. ' mins'
		end

		local auto_theme = require('lualine.themes.auto')
		local lualine_modes = { 'insert', 'normal', 'visual', 'command', 'replace', 'inactive', 'terminal' }
		for _, field in ipairs(lualine_modes) do
			if auto_theme[field] and auto_theme[field].c then
				auto_theme[field].c.bg = COLORS.transparent
			end
		end

		require('lualine').setup({
			options = {
				component_separators = { left = '', right = '' },
				disabled_filetypes = { statusline = { '', 'TelescopePrompt' } },
				globalstatus = true,
				refresh = { statusline = 284 },
				section_separators = { left = '', right = '' },
				theme = auto_theme,
			},
			sections = {
				lualine_a = {
					{
						function()
							return '▊'
						end,
						color = { fg = COLORS.blue, bg = COLORS.transparent },
						padding = { left = 0, right = 0 },
					},
					{
						'filetype',
						color = { bg = COLORS.transparent },
						colored = true,
						icon_only = true,
						padding = { left = 1, right = 0 },
					},
				},
				lualine_b = {
					{
						'filename',
						color = { bg = COLORS.transparent, fg = COLORS.text },
						path = 4,
						symbols = { modified = '[+]', newfile = '  ', readonly = '[-]', unnamed = '  ' },
					},
				},
				lualine_c = {
					{
						'location',
						color = { bg = COLORS.transparent, fg = COLORS.sapphire },
					},
					{
						'progress',
						color = { bg = COLORS.transparent, fg = COLORS.sapphire },
					},
					{
						word_count,
						color = { bg = COLORS.transparent, fg = COLORS.overlay0, gui = 'italic' },
						cond = function()
							return n.filetype.is_reading_ft()
						end,
						icon = '',
					},
					{
						reading_time,
						color = { bg = COLORS.transparent, fg = COLORS.overlay0, gui = 'italic' },
						cond = function()
							return n.filetype.is_reading_ft()
						end,
						icon = '󱑎',
					},
				},
				lualine_x = {
					{
						'diagnostics',
						color = { bg = COLORS.transparent, gui = 'bold' },
						symbols = { error = '󰅙 ', hint = '󰌵 ', info = '󰋼 ', warn = ' ' },
					},
				},
				lualine_y = {
					{
						'diff',
						color = { bg = COLORS.transparent, gui = 'bold' },
						symbols = { added = ' ', modified = ' ', removed = ' ' },
						source = function()
							---@diagnostic disable-next-line: undefined-field
							local gitsigns = vim.b.gitsigns_status_dict

							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
					{
						function()
							return ''
						end,

						cond = function()
							return n.filetype.is_reading_ft() and vim.opt.spell:get()
						end,
						color = { bg = COLORS.transparent, fg = COLORS.lavander, gui = 'bold' },
					},
					{
						'branch',
						color = { bg = COLORS.transparent, fg = COLORS.mauve, gui = 'bold' },
						icon = '',
					},
				},
				lualine_z = {
					{
						'n_lsp_servers',
						color = { bg = COLORS.transparent, fg = COLORS.lavender },
						cond = function()
							return vim.fn.winwidth(0) > 167
						end,
					},
					{
						function()
							return '▊'
						end,
						color = { fg = COLORS.blue, bg = COLORS.transparent },
						padding = { left = 0, right = 0 },
					},
				},
			},
		})
	end,
}
