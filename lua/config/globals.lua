vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

_G.P = function(v)
	print(vim.inspect(v))
	return v
end

_G.nikola_group = vim.api.nvim_create_augroup('NikolaGroup', { clear = true })
