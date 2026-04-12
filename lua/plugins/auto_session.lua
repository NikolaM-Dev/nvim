---@module 'lazy.types'
---@type LazySpec
return {
	'rmagatti/auto-session',
	desc = 'A small automated session manager for Neovim',
	enabled = true,
	lazy = false,

	cmd = 'AutoSession',

	keys = {
		{
			'<leader>sR',
			function()
				vim.cmd('AutoSession save')
				vim.schedule(function()
					vim.cmd('restart')
				end)
			end,
			'󰑓 Restart persisting the session',
		},
		{
			'<leader>sr',
			function()
				vim.cmd('AutoSession delete')
				vim.schedule(function()
					vim.cmd('restart')
				end)
			end,
			'󰑓 Restart wihtout sessions',
		},
	},

	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		auto_save = false, -- Enables/disables auto saving session on exit
		-- post_restore_cmds = {
		-- 	function()
		-- 		if not _G.is_nnp_enabled() then
		-- 			vim.cmd('NoNeckPain')
		-- 		end
		-- 	end,
		-- },
	},
}
