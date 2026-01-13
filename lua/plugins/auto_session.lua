---@module 'lazy.types'
---@type LazySpec
return {
	'rmagatti/auto-session',
	desc = 'A small automated session manager for Neovim',
	enabled = true,
	lazy = false,

	cmd = 'AutoSession',

	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		post_restore_cmds = {
			function()
				if not _G.is_nnp_enabled() then
					vim.cmd('NoNeckPain')
				end
			end,
		},
	},
}
