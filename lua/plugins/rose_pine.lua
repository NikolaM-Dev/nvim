---@module 'lazy.types'
---@type LazySpec
return {
	'rose-pine/neovim',
	desc = 'Soho vibes for Neovim',
	enabled = false,

	lazy = false,
	priority = 1000,
	name = 'rose-pine',

	---@type table
	opts = {
		highlight_groups = {
			['@markup.italic'] = { fg = 'subtle' },
			['@markup.strong'] = { fg = 'iris' },
		},

		styles = {
			transparency = true,
		},
	},

	---@param opts table
	config = function(_, opts)
		require('rose-pine').setup(opts)

		vim.cmd.colorscheme(' rose-pine-moon')

		-- snacks.lazygit highlights
		vim.api.nvim_set_hl(0, 'activeBorderColor', { fg = '#3e8fb0', bold = true })
		vim.api.nvim_set_hl(0, 'cherryPickedCommitBgColor', { fg = 'none' })
		vim.api.nvim_set_hl(0, 'cherryPickedCommitFgColor', { fg = '#f6c177' })
		vim.api.nvim_set_hl(0, 'defaultFgColor', { fg = '#e0def4' })
		vim.api.nvim_set_hl(0, 'inactiveBorderColor', { fg = '#6e6a86' })
		vim.api.nvim_set_hl(0, 'markedBaseCommitBgColor', { fg = 'none' })
		vim.api.nvim_set_hl(0, 'markedBaseCommitFgColor', { fg = '#f6c177' })
		vim.api.nvim_set_hl(0, 'optionsTextColor', { fg = '#9ccfd8' })
		vim.api.nvim_set_hl(0, 'searchingActiveBorderColor', { fg = '#f6c177', bold = true })
		vim.api.nvim_set_hl(0, 'selectedLineBgColor', { fg = '#393552' })
		vim.api.nvim_set_hl(0, 'unstagedChangesColor', { fg = '#6e6a86' })
	end,
}
