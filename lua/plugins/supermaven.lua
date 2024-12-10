local is_enabled = true
local logger = n.logger:new('Supermaven')

---@type LazySpec
return {
	'supermaven-inc/supermaven-nvim',
	enabled = true,

	cmd = { 'SupermavenToggle' },
	event = 'InsertEnter',

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
