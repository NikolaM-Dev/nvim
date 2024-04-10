vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

--- Print a value with vim.inspect
---@param v any The value to print
function _G.P(v)
	print(vim.inspect(v))
end

_G.augroup = function(name)
	return vim.api.nvim_create_augroup('nikola_' .. name, { clear = true })
end
