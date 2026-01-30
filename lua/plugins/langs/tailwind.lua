---@module 'lazy.types'
---@type LazySpec
return {
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'tailwindcss-language-server' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.tailwindcss = {}
		end,
	},
	{
		'ruicsh/tailwind-hover.nvim',
		desc = 'Shows consolidated Tailwind CSS styles applied to the element under the cursor',

		keys = {
			{ '<leader>K', '<cmd>TailwindHover<cr>', desc = ' Tailwind Hover' },
		},
		opts = {
			fallback_to_lsp_hover = true,
		},
	},
}
