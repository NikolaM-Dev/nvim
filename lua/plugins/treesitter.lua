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
			context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = 'all',

			autotag = enable,
			indent = enable,
			matchup = enable,
			rainbow = enable,
		})
	end,
}
