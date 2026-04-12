---@module 'lazy.types'
---@type LazySpec
return {
	'kevinhwang91/nvim-bqf',
	desc = 'Better quickfix window in Neovim, polish old quickfix window.',
	enabled = true,

	dependencies = { 'junegunn/fzf' },
	ft = 'qf',

	config = function()
		---@diagnostic disable: missing-fields
		require('bqf').setup({
			filter = {
				fzf = {
					extra_opts = {
						'--bind',
						'ctrl-o:toggle-all,ctrl-f:preview-half-page-down,ctrl-b:preview-half-page-up',
						'--pointer',
						'',
						'--prompt',
						'   ',
						'--reverse',
					},
				},
			},
			preview = {
				winblend = 0,
			},
		})
	end,
}
