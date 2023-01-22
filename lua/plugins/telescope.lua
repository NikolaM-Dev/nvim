local Util = require('util')

return {
	'nvim-telescope/telescope.nvim',
	event = 'VeryLazy',
	-- cmd = { "Telescope" },
	keys = {
		{ '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search Buffer' },
		{ '<leader>:', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
		{ '<leader>fu', '<cmd>Telescope undo<cr>', desc = 'Undo' },
		{ '<leader>ff', Util.telescope('files'), desc = 'Find Files (Root)' },
		{ '<leader>fF', Util.telescope('files', { cwd = false }), desc = 'Find Files (CWD)' },
		{ '<leader>fg', '<cmd>Telescope live_grep theme=ivy<cr>', desc = 'Live Grep' },
		{ '<leader>bb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
		{ '<leader>sc', Util.telescope('colorscheme', { enable_preview = true }), desc = 'Colorscheme' },
		{ '<leader>sw', Util.telescope('grep_string'), desc = 'Word (Root)' },
		{ '<leader>sW', Util.telescope('grep_string', { cwd = false }), desc = 'Word (CWD)' },
		{ '<leader>so', '<cmd>Telescope vim_options<cr>', desc = 'Options' },
		{ '<leader>sC', '<cmd>Telescope commands<cr>', desc = 'Commands' },
		{
			'<leader>sh',
			function()
				require('telescope.builtin').help_tags({ default_text = vim.call('expand', '<cword>') })
			end,
			desc = 'Help',
		},
		{ '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps' },
		{ '<leader>mm', '<cmd>Telescope marks<cr>', desc = 'Search Marks' },
		{ '<leader>sM', '<cmd>Telescope man_pages<cr>', desc = 'Man Pages' },
		{ '<leader>sp', '<cmd>Telescope projects<cr>', desc = 'Projects' },
		{ '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },
		{ '<leader>sr', '<cmd>Telescope registers<cr>', desc = 'Registers' },
		{
			'<leader>ss',
			Util.telescope('lsp_document_symbols', {
				symbols = {
					'Class',
					'Function',
					'Method',
					'Constructor',
					'Interface',
					'Module',
					'Struct',
					'Trait',
					'Field',
					'Property',
				},
			}),
			desc = 'Goto Symbol',
		},
	},
	dependencies = {
		'nvim-telescope/telescope-symbols.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'debugloop/telescope-undo.nvim',
		{
			'ahmedkhalf/project.nvim',
			config = function()
				require('project_nvim').setup({
					detection_methods = {
						'lsp',
						'pattern',
					},
					patterns = {
						'.git',
						'Makefile',
						'package.json',
						'DESCRIPTION',
					},
				})
			end,
		},
	},

	config = function()
		local action_layout = require('telescope.actions.layout')

		-- Don't preview binaries
		local previewers = require('telescope.previewers')
		local Job = require('plenary.job')
		local new_maker = function(filepath, bufnr, opts)
			filepath = vim.fn.expand(filepath)
			Job:new({
				command = 'file',
				args = { '--mime-type', '-b', filepath },
				on_exit = function(j)
					local mime_type = vim.split(j:result()[1], '/')[1]
					if mime_type == 'text' then
						previewers.buffer_previewer_maker(filepath, bufnr, opts)
					else
						-- maybe we want to write something to the buffer here
						vim.schedule(function()
							vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
						end)
					end
				end,
			}):sync()
		end

		-- Search hidden/dot files, but not in `.git`.
		local telescopeConfig = require('telescope.config')
		local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
		table.insert(vimgrep_arguments, { '--hidden', '--glob', '!**/.git/*' })

		local trouble = require('trouble.providers.telescope')
		local undo = require('telescope-undo.actions')

		local telescope = require('telescope')
		local function no_ignore()
			Util.telescope('find_files', { no_ignore = true })()
		end

		local function hidden()
			Util.telescope('find_files', { hidden = true })()
		end

		telescope.setup({
			extensions = {
				undo = {
					layout_strategy = 'horizontal',
					mappings = {
						i = {
							['<C-a>'] = undo.yank_additions,
							['<C-r>'] = undo.yank_deletions,
							['<cr>'] = undo.restore,
						},
						n = {
							['<C-a>'] = undo.yank_additions,
							['<C-r>'] = undo.yank_deletions,
							['<cr>'] = undo.restore,
						},
					},
				},
			},
			defaults = {
				prompt_prefix = ' ',
				selection_caret = ' ',
				buffer_previewer_maker = new_maker, -- don't preview binaries
				vimgrep_arguments = vimgrep_arguments,
				file_ignore_patterns = { '.git/', 'node_modules', '/tmp', '/usr', '.local' },
				winblend = 10,
				dynamic_preview_title = true,
				layout_strategy = 'horizontal',
				layout_config = {
					prompt_position = 'top',
				},
				sorting_strategy = 'ascending',
				mappings = {
					i = {
						['<c-t>'] = trouble.open_with_trouble,
						['<C-Down>'] = require('telescope.actions').cycle_history_next,
						['<C-Up>'] = require('telescope.actions').cycle_history_prev,
						['<M-p>'] = action_layout.toggle_preview,
						['<M-i>'] = no_ignore,
						['<M-h>'] = hidden,
					},
					n = {
						['<M-p>'] = action_layout.toggle_preview,
					},
				},
				pickers = {
					find_files = {
						find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
					},
				},
			},
		})
		-- load extensions
		telescope.load_extension('fzf')
		telescope.load_extension('undo')
		telescope.load_extension('projects')
	end,
}
