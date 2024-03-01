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
		})
	end,
}
