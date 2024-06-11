return {
	'zbirenbaum/copilot.lua',
	enabled = false,

	cmd = 'Copilot',
	event = 'InsertEnter',
	config = function()
		require('copilot').setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
