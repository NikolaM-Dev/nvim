---@module 'lazy.types'
---@type LazySpec
return {
	'mbbill/undotree',
	enabled = true,

	keys = {
		{ '<backspace>u', '<cmd>UndotreeToggle<cr>', desc = 'Toggle [U]ndo Tree' },
	},

	init = function()
		vim.g.undotree_CustomDiffpanelCmd = 'botright 15 new' -- increase diff window size
		vim.g.undotree_SetFocusWhenToggle = 1 -- set focus to the undotree window when opening it
		vim.g.undotree_ShortIndicators = 1 -- from  (5 seconds ago) to (5 s)
		vim.g.undotree_WindowLayout = 2 -- L shape layout
	end,
}
