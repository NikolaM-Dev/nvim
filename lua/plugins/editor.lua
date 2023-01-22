return {

	-- Better diagnostics list
	{
		'folke/trouble.nvim',
		cmd = { 'TroubleToggle', 'Trouble' },
		opts = {
			auto_open = false,
			use_diagnostic_signs = true,
		},
		keys = {
			{ '<leader>dx', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Document Diagnostics (Trouble)' },
			{ '<leader>dX', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace Diagnostics (Trouble)' },
		},
	},

	-- Easy commenting
	{
		'numToStr/Comment.nvim',
		keys = { { 'gc', mode = { 'n', 'v' } }, 'gcc', 'gbc' },
		dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
		config = function()
			require('Comment').setup({
				pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
			})
		end,
	},

	-- Git signs in status column
	{
		'lewis6991/gitsigns.nvim',
		event = 'BufReadPre',
		opts = {
			signs = {
				add = { text = '▎' },
				change = { text = '▎' },
				delete = { text = '契' },
				topdelete = { text = '契' },
				changedelete = { text = '▎' },
				untracked = { text = '▎' },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				-- general git
				map('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', 'Checkout Branch')
				map('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', 'Checkout Commit')
				map('n', '<leader>gs', '<cmd>Telescope git_status<CR>', 'Git Status')
				map('n', '<leader>gl', gs.toggle_linehl, 'Toggle Line Highlight')
				map('n', '<leader>gL', gs.toggle_current_line_blame, 'Toggle Line Blame')
				map('n', '<leader>gw', gs.toggle_word_diff, 'Toggle Word Diff')
				map('n', '<leader>gd', gs.diffthis, 'Diff This')
				map('n', '<leader>gD', function()
					gs.diffthis('~')
				end, 'Diff This ~')

				-- hunks
				map('n', ']g', gs.next_hunk, 'Next Hunk')
				map('n', '[g', gs.prev_hunk, 'Prev Hunk')
				map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
				map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')
				map('n', '<leader>ghS', gs.stage_buffer, 'Stage Buffer')
				map('n', '<leader>ghu', gs.undo_stage_hunk, 'Undo Stage Hunk')
				map('n', '<leader>ghR', gs.reset_buffer, 'Reset Buffer')
				map('n', '<leader>ghp', gs.preview_hunk, 'Preview Hunk')
				map('n', '<leader>ghb', function()
					gs.blame_line({ full = true })
				end, 'Blame Line')
				map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
			end,
		},
	},

	-- Show color of color values
	{
		'NvChad/nvim-colorizer.lua',
		event = 'BufReadPre',
		keys = { { '<leader>uC', '<cmd>ColorizerToggle<CR>', desc = 'Toggle Colorizer' } },
		opts = {
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				AARRGGBB = false, -- 0xAARRGGBB hex codes
				rgb_fn = false, -- CSS rgb() and rgba() functions
				hsl_fn = false, -- CSS hsl() and hsla() functions
				css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				mode = 'virtualtext',
				virtualtext = '⬤',
			},
			filetypes = {
				'*',
				'!dirvish',
				'!fugitive',
				'!alpha',
				'!NvimTree',
				'!Lazy',
				'!Trouble',
				'!lir',
				'!Outline',
				'!spectre_panel',
				'!toggleterm',
				'!DressingSelect',
				'!TelescopePrompt',
				'!rbrowser',
				'!rdoc',
			},
			-- all the sub-options of filetypes apply to buftypes
			buftypes = {
				'!nofile',
				'!prompt',
				'!popup',
				'!scratch',
				'!unlisted',
			},
		},
	},

	-- Location jumping and enhanced f/t
	{
		'ggandor/leap.nvim',
		event = 'BufReadPost',
		keys = {
			{ mode = { 'n', 'x', 'o' }, 's', '<Plug>(leap-forward-to)', desc = 'Leap Forward' },
			{ mode = { 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward-to)', desc = 'Leap Backward' },
			{ 'gS', '<Plug>(leap-cross-window)', desc = 'Leap Across Window' },
			{
				'gs',
				function()
					require('leap').leap({ target_windows = { vim.api.nvim_get_current_win() } })
				end,
				desc = 'Leap in Window',
			},
			{
				mode = { 'n', 'x', 'o' },
				'<M-a>',
				function()
					require('leap-ast').leap()
				end,
				desc = 'Leap Node',
			},
		},
		dependencies = {
			{
				'ggandor/flit.nvim',
				opts = {
					labeled_modes = 'nvo',
					multiline = false,
				},
			},
			'ggandor/leap-ast.nvim',
		},
		config = function()
			vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
		end,
	},

	-- Better % matching
	{
		'andymass/vim-matchup',
		event = 'BufReadPost',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }
		end,
	},

	-- Auto insert matching pair character
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = function()
			local npairs = require('nvim-autopairs')
			npairs.setup({
				check_ts = true,
				ts_config = {
					lua = { 'string', 'source', 'comment' },
				},
				disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
				fast_wrap = {},
			})
			local Rule = require('nvim-autopairs.rule')

			npairs.add_rule(Rule('<', '>', 'lua'))
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			---@diagnostic disable-next-line: undefined-field
			require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
		end,
	},

	-- More natural split navigation
	{
		'mrjones2014/smart-splits.nvim',
		event = 'BufReadPost',
		keys = {
			{
				'<C-h>',
				function()
					require('smart-splits').move_cursor_left()
				end,
				desc = 'Move to Left Window',
			},
			{
				'<C-j>',
				function()
					require('smart-splits').move_cursor_down()
				end,
				desc = 'Move to Lower Window',
			},
			{
				'<C-k>',
				function()
					require('smart-splits').move_cursor_up()
				end,
				desc = 'Move to Upper Window',
			},
			{
				'<C-l>',
				function()
					require('smart-splits').move_cursor_right()
				end,
				desc = 'Move to Right Window',
			},
			{
				'<M-Right>',
				mode = { 'n', 'i' },
				function()
					require('smart-splits').move_cursor_left()
				end,
				desc = 'Move to Left Window',
			},
			{
				'<M-Down>',
				mode = { 'n', 'i' },
				function()
					require('smart-splits').move_cursor_down()
				end,
				desc = 'Move to Lower Window',
			},
			{
				'<M-Up>',
				mode = { 'n', 'i' },
				function()
					require('smart-splits').move_cursor_up()
				end,
				desc = 'Move to Upper Window',
			},
			{
				'<M-Left>',
				mode = { 'n', 'i' },
				function()
					require('smart-splits').move_cursor_right()
				end,
				desc = 'Move to Right Window',
			},
			{
				'<C-Left>',
				mode = { 'n', 'i' },
				function()
					require('smart-splits').resize_left()
				end,
				desc = 'Resize Window Left',
			},
			{
				'<C-Down>',
				mode = { 'n', 'i' },
				function()
					require('smart-splits').resize_down()
				end,
				desc = 'Resize  Window Down',
			},
			{
				'<C-Up>',
				mode = { 'n', 'i' },
				function()
					require('smart-splits').resize_up()
				end,
				desc = 'Resize Window Up ',
			},
			{
				'<C-Right>',
				mode = { 'n', 'i' },
				function()
					require('smart-splits').resize_right()
				end,
				desc = 'Resize Window Right',
			},
		},
		opts = {
			ignored_filetypes = {
				'nofile',
				'quickfix',
				'prompt',
			},
			ignored_buftypes = { 'NvimTree' },
			move_cursor_same_row = true,
		},
	},

	-- Better text moving
	{
		'echasnovski/mini.move',
		event = 'BufReadPre',
		keys = {
			{ mode = { 'n', 'x' }, '<M-h>', '<M-j>', '<M-k>', '<M-l>' },
		},
		config = function()
			require('mini.move').setup()
		end,
	},

	-- Folding
	{
		'kevinhwang91/nvim-ufo',
		dependencies = 'kevinhwang91/promise-async',
		event = 'BufReadPost',
		opts = {},

		init = function()
			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set('n', 'zR', function()
				require('ufo').openAllFolds()
			end)
			vim.keymap.set('n', 'zM', function()
				require('ufo').closeAllFolds()
			end)
		end,
	},

	-- Custom operator mappings
	{
		'zdcthomas/yop.nvim',
		keys = {
			{ mode = { 'n', 'x' }, '<leader>O', desc = 'Sort' },
		},
		config = function()
			require('yop').op_map({ 'n', 'x' }, '<leader>O', require('util').sort)
		end,
	},

	-- Escape from surrounds
	{
		'abecodes/tabout.nvim',
		keys = {
			{ mode = 'i', '<M-h>' },
			{ mode = 'i', '<M-l>' },
		},
		opts = {
			tabkey = '<M-l>',
			backwards_tabkey = '<M-h>',
			act_as_tab = false,
			act_as_shift_tab = false,
			completion = false,
			tabouts = {
				{ open = '<', close = '>' },
				{ open = '\'', close = '\'' },
				{ open = '"', close = '"' },
				{ open = '`', close = '`' },
				{ open = '(', close = ')' },
				{ open = '[', close = ']' },
				{ open = '{', close = '}' },
			},
		},
	},
}
