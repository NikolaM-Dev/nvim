---@type LazySpec
return {
	'zk-org/zk-nvim',
	enabled = true,

	event = 'VeryLazy',
	cond = function()
		local cwd = vim.fn.getcwd()

		return string.find(cwd, 'second%-brain%.md') ~= nil
	end,

	keys = {
		{ '<leader>zb', '<cmd>ZkBacklinks<cr>', desc = '[Z]k [B]acklinks' },
		{ '<leader>ze', '<cmd>ZkNotes { sort = { \'modified\' } }<cr>', desc = '[Z]k [E]dit' },
		{ '<leader>zl', '<cmd>ZkLinks<cr>', desc = '[Z]k [L]inks' },
		{ '<leader>zt', '<cmd>ZkTags<cr>', desc = '[Z]k [T]ags' },
	},

	---@type table
	opts = {
		lsp = {
			auto_attach = {
				enabled = false,
			},
		},
	},

	---@param opts? table
	config = function(_, opts)
		require('zk').setup(opts)
			},
	end,
}
