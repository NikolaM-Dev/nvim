return {
	'nvim-lualine/lualine.nvim',
	enabled = true,
	event = 'VeryLazy',
	config = function()
		local COLORS = {
			blue = '#89b4fa',
			lavender = '#b4befe',
			mauve = '#cba6f7',
			sapphire = '#74c7ec',
			text = '#cdd6f4',
			transparent = '',
		}

		-- TODO: Re-evaluate this
		local function hide_in_width(min_width)
			min_width = min_width or 105

			return vim.fn.winwidth(0) > min_width
		end

		require('lualine').setup({
			options = {
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				globalstatus = true,
				refresh = { statusline = 284 },
				disabled_filetypes = {
					statusline = {
						'',
						'TelescopePrompt',
					},
				},
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
						path = function()
							if hide_in_width() then
								return 0
							end

							return 1
						end,
						symbols = { modified = '[+]', newfile = '  ', readonly = '[-]', unnamed = '  ' },
					},
				},
				lualine_c = {
					{
						'location',
						color = { fg = COLORS.sapphire },
					},
					{
						'progress',
						color = { fg = COLORS.sapphire },
						cond = hide_in_width,
					},
				},
				lualine_x = {
					{
						'diagnostics',
						color = { gui = 'bold' },
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
							return hide_in_width(167)
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
