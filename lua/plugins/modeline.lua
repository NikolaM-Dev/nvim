---@module 'lazy'
---@type LazySpec
return {
	'NikolaM-Dev/modeline.nvim',
	desc = 'Neovim statusline plugin blazing fast than any statusline plugin',
	enabled = true,

	dir = '~/w/1-projects/modeline.nvim',
	event = { 'BufReadPost */*', 'BufNewFile' },

	config = function()
		require('modeline').setup()

		vim.api.nvim_set_hl(0, 'ModeLineGitAdd', { fg = '#9ccfd8' })
		vim.api.nvim_set_hl(0, 'ModeLineGitChange', { fg = '#ea9a97' })
		vim.api.nvim_set_hl(0, 'ModeLineGitDelete', { fg = '#eb6f92' })
	end,
}
