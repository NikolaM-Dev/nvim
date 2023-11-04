return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	event = { 'BufAdd', 'BufNewFile', 'BufReadPre' },
	keys = {
		{ '<C-space>', desc = 'Increment selection' },
		{ '<bs>', desc = 'Schrink selection', mode = 'x' },
	},
	config = function()
		local enable = { enable = true }

		---@diagnostic disable-next-line: missing-fields
		require('nvim-treesitter.configs').setup({
			highlight = {
				enable = true,
				-- Disable slow treesitter highlight for large files
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},

			auto_install = true,
			ensure_installed = {
				'bash',
				'c',
				'cpp',
				'diff',
				'dockerfile',
				'gitcommit',
				'gitignore',
				'go',
				'html',
				'javascript',
				'jsdoc',
				'json',
				'jsonc',
				'lua',
				'luadoc',
				'luap',
				'make',
				'markdown',
				'markdown_inline',
				'python',
				'query',
				'query',
				'regex',
				'regex',
				'scss',
				'toml',
				'tsx',
				'typescript',
				'vim',
				'vimdoc',
				'vimdoc',
				'yaml',
			},

			context_commentstring = { enable = true, enable_autocmd = false },
			indent = enable,
			matchup = enable,
		})
	end,
}
