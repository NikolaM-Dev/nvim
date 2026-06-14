---@module 'lazy.types'
---@type LazySpec
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'bash' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'bash-debug-adapter', 'bash-language-server', 'shfmt' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.bashls = {
				filetypes = { 'bash', 'sh', 'zsh' },
			}
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.bash = { 'shfmt' }
			opts.formatters_by_ft.sh = { 'shfmt' }
			opts.formatters_by_ft.zsh = { 'shfmt' }
		end,
	},

	{
		'mfussenegger/nvim-dap',

		---@param opts nkl.debug
		opts = function(_, opts)
			opts.adapters.bashdb = {
				command = 'bash-debug-adapter',
				id = 'bashdb',
				name = 'bashdb',
				type = 'executable',
			}

			opts.configurations.bash = {
				{
					name = '  Launch file',
					type = 'bashdb',
					request = 'launch',
					file = '${file}',
					program = '${file}',
					cwd = '${workspaceFolder}',
					args = {},
					argsString = '',
					env = {},
					pathBash = '/bin/bash',
					pathCat = 'cat',
					pathMkfifo = 'mkfifo',
					pathPkill = 'pkill',
					terminalKind = 'integrated',
					pathBashdb = vim.fn.stdpath('data')
						.. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
					pathBashdbLib = vim.fn.stdpath('data') .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
				},
			}

			opts.configurations.sh = opts.configurations.bash
			opts.configurations.zsh = opts.configurations.bash
		end,
	},
}
