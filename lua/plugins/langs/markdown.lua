---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'markdown', 'markdown_inline' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'marksman', 'prettier' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			-- opts.servers.marksman = {}
		end,
	},
	{
		'nvimdev/guard.nvim',
		desc = 'Lightweight, fast and async formatting and linting plugin for Neovim',
		lazy = false,

		config = function()
			require('guard.filetype')('markdown'):fmt(function()
				-- Always format markdown with prettier-sb:
				-- prefer project-local `node_modules/.bin/prettier`
				-- (in second-brain this *is* the prettier-sb fork),
				-- fallback to the global `prettier-sb` binary.
				local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
				local start_dir = bufname ~= '' and vim.fn.fnamemodify(bufname, ':h') or vim.fn.getcwd()
				local local_prettier =
					vim.fs.find('node_modules/.bin/prettier', { upward = true, path = start_dir })[1]

				return {
					cmd = local_prettier or 'prettier-sb',
					args = { '--stdin-filepath' },
					fname = true,
					stdin = true,
				}
			end)
		end,
	},
	{
		'Gelio/cmp-natdat',
		desc = 'nvim-cmp source to autocomplete natural dates and turm them into ISO dates',
		enabled = true,
		config = true,
	},

	{
		'saghen/blink.cmp',

		---@module 'blink-cmp'
		---@type blink.cmp.Config
		opts = {
			sources = {
				per_filetype = {
					markdown = { inherit_defaults = true, 'natdat' },
					text = { inherit_defaults = true, 'natdat' },
				},
				providers = {
					emmet = { name = 'natdat', module = 'blink.compat.source' },
				},
			},
		},
	},
}
