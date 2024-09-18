---@type LazySpec
return {
	'bullets-vim/bullets.vim',
	enabled = true,

	ft = { 'gitcommit', 'markdown', 'text' },
	init = function()
		vim.g.bullets_outline_levels = {
			'ROM',
			'ABC',
			'num',
			'abc',
			'rom',
			'std-',
			-- 'std*',
			-- 'std+'
		}

		vim.g.bullets_checkbox_markers = ' 369x'

		vim.g.bullets_custom_mappings = {
			{ 'imap', '<cr>', '<Plug>(bullets-newline)' },
			{ 'inoremap', '<C-cr>', '<cr>' },

			{ 'nmap', 'o', '<Plug>(bullets-newline)' },

			{ 'vmap', 'gN', '<Plug>(bullets-renumber)' },
			{ 'nmap', 'gN', '<Plug>(bullets-renumber)' },

			{ 'nmap', '<leader>x', '<Plug>(bullets-toggle-checkbox)' },

			{ 'imap', '<C-t>', '<Plug>(bullets-demote)' },
			{ 'nmap', '>>', '<Plug>(bullets-demote)' },
			{ 'vmap', '>', '<Plug>(bullets-demote)' },
			{ 'imap', '<C-d>', '<Plug>(bullets-promote)' },
			{ 'nmap', '<<', '<Plug>(bullets-promote)' },
			{ 'vmap', '<', '<Plug>(bullets-promote)' },
		}
	end,
}
