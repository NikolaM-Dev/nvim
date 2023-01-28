return {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	event = 'BufReadPost',
	opts = {
		open_fold_hl_timeout = 40,
	},
	init = function()
		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		vim.keymap.set('n', 'zR', function()
			require('ufo').openAllFolds()
		end)
		vim.keymap.set('n', 'zM', function()
			require('ufo').closeAllFolds()
		end)
	end,
}
