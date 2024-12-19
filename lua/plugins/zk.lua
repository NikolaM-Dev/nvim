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
		{ '<leader>zl', '<cmd>ZkLinks<cr>', desc = '[Z]k [L]inks' },
}
