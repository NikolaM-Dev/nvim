local is_enabled = true
local logger = n.logger:new('Supermaven')

---@type LazySpec
return {
	'supermaven-inc/supermaven-nvim',
	enabled = true,

	event = 'InsertEnter',
	commit = '40bde487fe31723cdd180843b182f70c6a991226',

	cmd = { 'SupermavenToggle' },

	keys = {
		{
			'<leader>ai',
			function()
				vim.cmd('SupermavenToggle')
				is_enabled = not is_enabled

				if is_enabled then
					logger:info('Supermaven is enabled')
				else
					logger:warn('Supermaven is disabled')
				end
			end,
			desc = 'Toggle Supermaven [A][I]',
		},
	},

	config = true,
}
