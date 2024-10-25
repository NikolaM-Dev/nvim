vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

---Print a value with vim.inspect
---@param payload any The value to print
function _G.P(payload)
	print(vim.inspect(payload))
end

---Create an autogroup with nikola prefix
---@param name string The name of the autogroup
function _G.augroup(name)
	return vim.api.nvim_create_augroup('nikola_' .. name, { clear = true })
end
