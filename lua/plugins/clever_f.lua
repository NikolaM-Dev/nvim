---@module 'lazy.types'
---@type LazySpec
return {
	'rhysd/clever-f.vim',
	desc = 'Extended f, F, t and T key mappings for Vim.',
	enabled = true,

	init = function()
		vim.g.clever_f_not_overwrites_standard_mappings = 1
	end,

	keys = {
		{
			'f',
			function()
				require('eyeliner').highlight({ forward = true })
				return '<Plug>(clever-f-f)'
			end,
			mode = { 'n', 'x', 'o' },
			expr = true,
			desc = ' Clever f',
		},
		{
			'F',
			function()
				require('eyeliner').highlight({ forward = false })
				return '<Plug>(clever-f-F)'
			end,
			mode = { 'n', 'x', 'o' },
			expr = true,
			desc = ' Clever F',
		},
		{
			't',
			function()
				require('eyeliner').highlight({ forward = true })
				return '<Plug>(clever-f-t)'
			end,
			mode = { 'n', 'x', 'o' },
			expr = true,
			desc = ' Clever t',
		},
		{
			'T',
			function()
				require('eyeliner').highlight({ forward = false })
				return '<Plug>(clever-f-T)'
			end,
			mode = { 'n', 'x', 'o' },
			expr = true,
			desc = ' Clever T',
		},
	},
}
