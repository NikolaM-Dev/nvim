vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

_G.P = function(v)
	print(vim.inspect(v))
	return v
end

_G.augroup = function(name)
	return vim.api.nvim_create_augroup('nikola_' .. name, { clear = true })
end
