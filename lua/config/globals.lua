vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

---Print one o multiple values with vim.inspect
---@param ...any
function _G.P(...)
	print(type(...))
	if type(...) ~= 'table' then
		print(vim.inspect(...))

		return
	end

	for _, payload in ipairs({ ... }) do
		if type(payload) ~= 'table' then
			for _, v in pairs(payload) do
				print(vim.inspect(v))
			end

			return
		end

		print(vim.inspect(payload))
	end
end

---Create an autogroup with nikola prefix
---@param name string The name of the autogroup
function _G.augroup(name)
	return vim.api.nvim_create_augroup('nikola_' .. name, { clear = true })
end

_G.n = require('lib')
