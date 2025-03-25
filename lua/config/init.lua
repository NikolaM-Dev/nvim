-- Use `uv` instead of `loop` as far as possible
vim.uv = vim.uv or vim.loop

require('config.globals')

-- autocmds can be loaded lazily when not opening a file
local lazy_autocmds = vim.fn.argc(-1) == 0
if not lazy_autocmds then
	require('config.autocmds')
end

vim.api.nvim_create_autocmd('User', {
	group = _G.augroup('bootstrap'),
	pattern = 'VeryLazy',
	callback = function()
		if lazy_autocmds then
			require('config.autocmds')
		end

		require('config.keymaps')
	end,
})

require('config.options')
require('config.lazy')
