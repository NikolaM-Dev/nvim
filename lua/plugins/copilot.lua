return {
	'zbirenbaum/copilot.lua',
	enabled = false,

	cmd = 'Copilot',
	event = 'InsertEnter',
	config = function()
		local disabled = { enabled = false }

		require('copilot').setup({
			panel = disabled,
			suggestion = disabled,
		})
	end,
}
