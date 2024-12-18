---@type LazySpec
return {
	'zk-org/zk-nvim',
	enabled = true,

	event = 'VeryLazy',
	cond = function()
		local cwd = vim.fn.getcwd()

		return string.find(cwd, 'second%-brain%.md') ~= nil
	end,
}
