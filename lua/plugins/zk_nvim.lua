---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'zk-org/zk-nvim',
	desc = 'Neovim extension for zk',
	enabled = true,

	event = 'VeryLazy',

	keys = {
		{ '<C-n><C-i>', '<cmd>ZkInsertLink<cr>', desc = '[Z]k [L]inks', mode = 'i' },
		{ '<leader>ze', '<cmd>ZkNotes { sort = { \'modified\' } }<cr>', desc = '[Z]k [E]dit' },
		{ 'gb', '<cmd>ZkBacklinks<cr>', desc = '[Z]k [B]acklinks' },
		{ 'gl', '<cmd>ZkLinks<cr>', desc = '[Z]k [L]inks' },

		-- { '<leader>zn', '<cmd>Telescope nzk templates<cr>', desc = 'n[Z]k [T]emplates' },
		-- { '<leader>zt', '<cmd>ZkTags<cr>', desc = '[Z]k [T]ags' },
	},
	---@type table
	opts = {
		picker = 'snacks_picker',

		picker_options = {
			snacks_picker = {
				layout = {
					preset = 'ivy_split',
				},
			},
		},

		lsp = {
			config = {
				cmd = { 'zk', 'lsp', '--log', '/tmp/zk-lsp.log' },
				name = 'zk',
			},

			-- automatically attach buffers in a zk notebook that match the given filetypes
			auto_attach = {
				enabled = true,
			},
		},
		--
		-- auto_attach = {
		-- 	enabled = false,
		-- 	filetypes = { 'markdown' },
		-- },
		-- },
	},

	---@param opts? table
	config = function(_, opts)
		require('zk').setup(opts)
	end,
}

-- return {
-- 	'zk-org/zk-nvim',
-- 	config = function()
-- 		local zk = require('zk')
-- 		local util = require('zk.util')
-- 		local commands = require('zk.commands')
--
-- 		zk.setup({
-- 			picker = 'custom_snacks_picker',
-- 		})
--
-- 		local function make_edit_fn(defaults, picker_options)
-- 			return function(options)
-- 				options = vim.tbl_extend('force', defaults, options or {})
-- 				zk.edit(options, picker_options)
-- 			end
-- 		end
--
-- 		local function make_new_fn(defaults)
-- 			return function(options)
-- 				options = vim.tbl_extend('force', defaults, options or {})
-- 				zk.new(options)
-- 			end
-- 		end
--
-- 		commands.add('Zkrphans', make_edit_fn({ orphan = true }, { title = 'Zk Orphans' }))
-- 		commands.add('ZkRecents', make_edit_fn({ createdAfter = '2 weeks ago' }, { title = 'Zk Recents' }))
-- 		commands.add('ZkLiveGrep', function(options)
-- 			options = options or {}
-- 			local notebook_path = options.notebook_path or util.resolve_notebook_path(0)
-- 			local notebook_root = util.notebook_root(notebook_path)
-- 			if notebook_root then
-- 				require('snacks').picker.grep({
-- 					cwd = notebook_root,
-- 					title = 'Zk Live Grep',
-- 				})
-- 			else
-- 				vim.notify('No notebook found', vim.log.levels.ERROR)
-- 			end
-- 		end)
--
-- 		vim.api.nvim_create_user_command('ZkNewMeeting', function(params)
-- 			zk.new({ dir = 'meetings', title = params.args })
-- 		end, { nargs = 1 })
--
-- 		vim.api.nvim_create_user_command('ZkNewNote', function(params)
-- 			zk.new({ dir = 'notes', title = params.args })
-- 		end, { nargs = 1 })
--
-- 		vim.api.nvim_create_user_command('ZkNewZettel', function(params)
-- 			zk.new({ dir = 'zettel', title = params.args })
-- 		end, { nargs = 1 })
--
-- 		commands.add('ZkNewDaily', make_new_fn({ dir = 'journal/daily' }))
-- 		commands.add('ZkNewHealth', make_new_fn({ dir = 'journal/health' }))
--
-- 		commands.add(
-- 			'ZkDaily',
-- 			make_edit_fn({ hrefs = { 'journal/daily' }, sort = { 'created' } }, { title = 'Zk Daily' })
-- 		)
-- 		commands.add(
-- 			'ZkHealth',
-- 			make_edit_fn({ hrefs = { 'journal/health' }, sort = { 'created' } }, { title = 'Zk Health' })
-- 		)
--
-- 		vim.keymap.set('n', '<leader>zn', '<cmd>ZkNew<CR>', { noremap = true })
-- 		vim.keymap.set('x', '<leader>zn', ':\'<,\'>ZkNewFromTitleSelection<CR>', { noremap = true })
-- 		vim.keymap.set('x', '<leader>zn', ':\'<,\'>ZkNewFromContentSelection<CR>', { noremap = true })
-- 		vim.keymap.set('n', '<leader>ze', '<cmd>ZkNotes { sort = { \'modified\' } }<CR>', { noremap = true })
-- 		vim.keymap.set('n', '<leader>z/', '<cmd>ZkLiveGrep<CR>', { noremap = true })
-- 		vim.keymap.set('n', '<leader>zt', '<cmd>ZkTags<CR>', { noremap = true })
-- 		vim.keymap.set(
-- 			'n',
-- 			'<leader>zs',
-- 			'<cmd>ZkNotes { sort = { \'modified\' }, match = { vim.fn.input(\'Search: \') } }<CR>',
-- 			{ noremap = true }
-- 		)
-- 		vim.keymap.set('n', '<leader>zb', '<cmd>ZkBacklinks<CR>', { noremap = true })
-- 		vim.keymap.set('n', '<leader>zl', '<cmd>ZkLinks<CR>', { noremap = true })
-- 	end,
-- }
