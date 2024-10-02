---@type LazySpec
return {
	'supermaven-inc/supermaven-nvim',
	enabled = true,

	event = 'InsertEnter',
	commit = '40bde487fe31723cdd180843b182f70c6a991226',
	keys = {
		{ '<leader>ai', '<cmd>SupermavenToggle<cr>', desc = 'Toggle Supermaven [A][I]' },
	},

	config = function()
		require('supermaven-nvim').setup({
			condition = function()
				-- Determine if current buffer is in calendar path
				local is_calendar_path = string.match(vim.fn.expand('%:p:~'), 'calendar')

				return is_calendar_path ~= nil
			end,
		})
	end,
}
