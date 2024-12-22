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
				local api = require('supermaven-nvim.api')

				if api.is_running() then
					api.stop()
					logger:warn('Supermaven is disabled')
				else
					api.start()
					logger:info('Supermaven is enabled')
				end
			end,
			desc = 'Toggle Supermaven [A][I]',
		},
	},

	---@type table
	opts = {
		condition = function()
			return true
		end,
	},
}
