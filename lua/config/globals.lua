vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

_G.P = function(v)
	print(vim.inspect(v))
	return v
end
