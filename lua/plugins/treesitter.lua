return {
	{
		'CKolkey/ts-node-action',
		keys = {
			{
				mode = { 'n', 'x' },
				'<leader>cn',
				function()
					require('ts-node-action').node_action()
				end,
				desc = 'Trigger Node Action',
			},
		},
		config = true,
	},

	-- Show code context as top line
	{
		'nvim-treesitter/nvim-treesitter-context',
		event = 'BufReadPre',
		config = true,
	},

	-- Code tree based highlighting and other features
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = 'BufReadPost',
		keys = {
			{ '<C-space>', desc = 'Increment selection' },
			{ '<bs>', desc = 'Schrink selection', mode = 'x' },
		},
		dependencies = {
			'mrjones2014/nvim-ts-rainbow',
		},
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<C-space>',
					node_incremental = '<C-space>',
					scope_incremental = '<nop>',
					node_decremental = '<bs>',
				},
			},
			autopairs = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
			},
			matchup = { enable = true },
			ensure_installed = {
				'bash',
				'comment',
				'diff',
				'git_rebase',
				'gitignore',
				'help',
				'html',
				'json',
				'lua',
				'markdown',
				'markdown_inline',
				'python',
				'query',
				'r',
				'regex',
				'vim',
				'yaml',
			},
		},
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)
		end,
	},
}
