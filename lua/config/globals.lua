vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

_G.P = function(v)
	print(vim.inspect(v))
	return v
end

_G.augroup = function(name)
	return vim.api.nvim_create_augroup('nikola_' .. name, { clear = true })
end
