return {
	'windwp/nvim-spectre',
	keys = {
		{
			'<leader>S',
			'<cmd>lua require(\'spectre\').open()<CR>',
			desc = 'Open [S]pectre',
		},
		{
			'<leader>sw',
			'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
			desc = '[S]earch Current [W]ord',
		},
		{
			'<esc><cmd>lua require("spectre").open_visual()<CR>',
			'<leader>sw',
			desc = '[S]earch Current [W]ord',
			mode = 'v',
		},
		{
			'<leader>swp',
			'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
			desc = '[S]earch On Current File',
			mode = 'n',
		},
	},
	config = function()
		require('spectre').setup({
			line_sep = '╰───────────────────────────────────────────────────────────────────────────────',
			line_sep_start = '╭───────────────────────────────────────────────────────────────────────────────',
			live_update = true,
			result_padding = '│ ',
			mapping = {
				run_replace = {
					map = 'R',
					cmd = '<cmd>lua require(\'spectre.actions\').run_replace()<CR>',
					desc = '[R]eplace All',
				},
				run_current_replace = {
					map = 'C',
					cmd = '<cmd>lua require(\'spectre.actions\').run_current_replace()<CR>',
					desc = 'Replace [C]urrent',
				},
			},
		})
	end,
}
