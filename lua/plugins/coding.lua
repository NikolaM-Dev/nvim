return {

	-- Code block joing/splitting
	{
		'Wansmer/treesj',
		keys = {
			{ '<leader>J', '<cmd>TSJJoin<CR>', desc = 'Join Line' },
			{ '<leader>S', '<cmd>TSJSplit<CR>', desc = 'Split Line' },
		},
		cmd = { 'TSJSplit', 'TSJJoin' },
		opts = {
			use_default_keymaps = false,
			max_join_length = 150,
		},
	},

	-- Better text-objects
	{
		'echasnovski/mini.ai',
		keys = {
			{ 'a', mode = { 'x', 'o' } },
			{ 'i', mode = { 'x', 'o' } },
			{ '[f', desc = 'Prev function' },
			{ ']f', desc = 'Next function' },
		},
		dependencies = {
			{
				'nvim-treesitter/nvim-treesitter-textobjects',
				init = function()
					-- no need to load the plugin, since we only need its queries
					require('lazy.core.loader').disable_rtp_plugin('nvim-treesitter-textobjects')
				end,
			},
		},
		opts = function()
			-- add treesitter jumping
			local function jump(capture, start, down)
				local rhs = function()
					local parser = vim.treesitter.get_parser()
					if not parser then
						return vim.notify('No treesitter parser for the current buffer', vim.log.levels.ERROR)
					end

					local query = vim.treesitter.get_query(vim.bo.filetype, 'textobjects')
					if not query then
						return vim.notify('No textobjects query for the current buffer', vim.log.levels.ERROR)
					end

					local cursor = vim.api.nvim_win_get_cursor(0)

					local locs = {}
					for _, tree in ipairs(parser:trees()) do
						for capture_id, node, _ in query:iter_captures(tree:root(), 0) do
							if query.captures[capture_id] == capture then
								local range = { node:range() }
								local row = (start and range[1] or range[3]) + 1
								local col = (start and range[2] or range[4]) + 1
								if down and row > cursor[1] or (not down) and row < cursor[1] then
									table.insert(locs, { row, col })
								end
							end
						end
					end
					return pcall(vim.api.nvim_win_set_cursor, 0, down and locs[1] or locs[#locs])
				end

				local c = capture:sub(1, 1):lower()
				local lhs = (down and ']' or '[') .. (start and c or c:upper())
				local desc = (down and 'Next ' or 'Prev ')
					.. (start and 'start' or 'end')
					.. ' of '
					.. capture:gsub('%..*', '')
				vim.keymap.set('n', lhs, rhs, { desc = desc })
			end

			for _, capture in ipairs({ 'function.outer', 'class.outer' }) do
				for _, start in ipairs({ true, false }) do
					for _, down in ipairs({ true, false }) do
						jump(capture, start, down)
					end
				end
			end
		end,
		config = function()
			local ai = require('mini.ai')
			ai.setup({
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { '@block.outer', '@conditional.outer', '@loop.outer' },
						i = { '@block.inner', '@conditional.inner', '@loop.inner' },
					}, {}),
					f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
					c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {}),
				},
			})
		end,
	},

	-- More textobjects
	{
		'chrisgrieser/nvim-various-textobjs',
		event = 'BufReadPost',
		opts = {
			useDefaultKeymaps = true,
		},
	},

	-- Show outline of document symbols
	{
		'simrat39/symbols-outline.nvim',
		cmd = 'SymbolsOutline',
		init = function()
			vim.keymap.set('n', '<leader>cs', '<cmd>SymbolsOutline<cr>', { desc = 'Symbols Outline' })
		end,
		config = true,
	},

	-- Highlight function arguments
	{
		'm-demare/hlargs.nvim',
		event = 'BufReadPost',
		opts = {
			excluded_argnames = {
				usages = {
					lua = { 'self', 'use' },
				},
			},
		},
	},

	-- Dim everything button current context
	{ 'folke/twilight.nvim' },

	-- Hide distraction
	{
		'folke/zen-mode.nvim',
		cmd = 'ZenMode',
		opts = {
			window = {
				width = 1,
			},
			plugins = {
				gitsigns = true,
				tmux = true,
			},
		},
		keys = { { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen Mode' } },
	},
}
