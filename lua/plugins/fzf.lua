---@type LazySpec
return {
	'junegunn/fzf',
	enabled = true,

	ft = 'qf',

	build = function()
		vim.fn['fzf#install']()
	end,
}
