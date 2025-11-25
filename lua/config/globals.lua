vim.uv = vim.uv or vim.loop

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.clipboard = {
	name = 'xsel',
	copy = {
		['+'] = 'xsel --nodetach -i -b',
		['*'] = 'xsel --nodetach -i -p',
	},
	paste = {
		['+'] = 'xsel -o -b',
		['*'] = 'xsel -o -b',
	},
	cache_enabled = 1,
}

_G.is_in_gitsigns_diffthis = false
_G.nkl = require('lib')
