return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			vim.list_extend(opts.languages, { 'c', 'cpp', 'make' })
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { 'clang-format', 'clangd', 'codelldb' })
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			opts.servers.clangd = {
				init_options = {
					clangdFileStatus = true,
					completeUnimported = true,
					usePlaceholders = false,
				},
			}
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = function(_, opts)
			opts.formatters_by_ft.c = { 'clang-format' }
			opts.formatters_by_ft.cpp = { 'clang-format' }
		end,
	},
	{
		'mfussenegger/nvim-dap',

		---@param opts nkl.debug
		opts = function(_, opts)
			opts.adapters.codelldb = {
				command = 'codelldb',
				id = 'codelldb',
				type = 'executable',
			}

			opts.configurations.c = {
				{
					name = '  Launch main.c (codelldb)',
					type = 'codelldb',
					request = 'launch',
					program = vim.fn.getcwd() .. '/main',
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					preLaunchTask = 'build main.c',
				},
			}

			opts.configurations.cpp = opts.configurations.c
		end,
	},
}
