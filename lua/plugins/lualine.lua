return {
	'nvim-lualine/lualine.nvim',
	enabled = true,
	event = 'VeryLazy',
	config = function()
		require('lualine').setup({})
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
