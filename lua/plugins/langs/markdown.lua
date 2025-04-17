return {
	{
		'nvim-treesitter/nvim-treesitter',
		ft = 'markdown',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'markdown', 'markdown_inline' })
		end,
	},
	{
		'williamboman/mason.nvim',
		ft = 'markdown',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'marksman', 'prettier' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.marksman = {}
		end,
	},
	{
		'stevearc/conform.nvim',
		ft = 'markdown',
		opts = function(_, opts)
			opts.formatters_by_ft.markdown = { 'prettier' }
		end,
	},
	{
		'bullets-vim/bullets.vim',
		desc = 'Automated bullet lists',
		enabled = true,

		ft = { 'gitcommit', 'markdown', 'text' },
		init = function()
			vim.g.bullets_checkbox_markers = ' .oOx' -- Change `X` to `x` to keep markdown format standard
			vim.g.bullets_outline_levels = { 'ROM', 'ABC', 'num', 'abc', 'rom', 'std-' } -- Remove * + as outline levels
		end,
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		enabled = false,
		ft = 'markdown',

		opts = function()
			local disabled = { enabled = false }

			---@module 'render-markdown'
			---@type render.md.UserConfig
			return {
				sign = disabled,
				bullet = {
					icons = { '•' },
				},
				checkbox = {
					enabled = false,
					checked = {
						icon = ' ',
					},
					unchecked = {
						icon = ' ',
					},
					custom = {
						thirty_three = { raw = '[3]', rendered = '󰪠 ', highlight = 'RenderMarkdownTodo' },
						sixty_six = { raw = '[6]', rendered = '󰪢 ', highlight = 'RenderMarkdownTodo' },
						ninety_nine = { raw = '[9]', rendered = '󰪤 ', highlight = 'RenderMarkdownTodo' },
					},
				},
				completions = { blink = { enabled = true } },
				heading = { sign = false, icons = {} },
			}
		end,
	},
}
