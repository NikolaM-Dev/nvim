local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
	return
end

local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local noremap, silent = keymap.noremap, keymap.silent
local opts = keymap.new_opts

telescope.setup({
	defaults = {
		entry_prefix = '  ',
		prompt_prefix = '   ',
		selection_caret = '  ',
		file_ignore_patterns = {
			'.git/',
			'target/',
			'docs/',
			'vendor/*',
			'%.lock',
			'__pycache__/*',
			'%.sqlite3',
			'%.ipynb',
			'node_modules/*',
			-- "%.jpg",
			-- "%.jpeg",
			-- "%.png",
			'%.svg',
			'%.otf',
			'%.ttf',
			'%.webp',
			'.dart_tool/',
			'.github/',
			'.gradle/',
			'.idea/',
			'.settings/',
			'.vscode/',
			'__pycache__/',
			'build/',
			'env/',
			'gradle/',
			'node_modules/',
			'%.pdb',
			'%.dll',
			'%.class',
			'%.exe',
			'%.cache',
			'%.ico',
			'%.pdf',
			'%.dylib',
			'%.jar',
			'%.docx',
			'%.met',
			'smalljre_*/*',
			'.vale/',
			'%.burp',
			'%.mp4',
			'%.mkv',
			'%.rar',
			'%.zip',
			'%.7z',
			'%.tar',
			'%.bz2',
			'%.epub',
			'%.flac',
			'%.tar.gz',
		},
	},
	pickers = {
		find_files = { hidden = true },
		git_bcommits = { initial_mode = 'normal' },
		git_branches = { initial_mode = 'normal' },
		git_commits = { initial_mode = 'normal' },
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

telescope.load_extension('file_browser')
telescope.load_extension('fzf')
telescope.load_extension('neoclip')

nmap({
	{
		'<leader>fb',
		function()
			telescope.extensions.file_browser.file_browser({
				grouped = true,
				hidden = true,
				initial_mode = 'normal',
				path = '%:p:h',
			})
		end,
		opts(noremap, silent),
	},
	{ '<C-f>', cmd('Telescope current_buffer_fuzzy_find'), opts(noremap, silent) },
	{ '<leader>b', cmd('Telescope buffers'), opts(noremap, silent) },
	{ '<leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
	{ '<leader>fch', cmd('Telescope command_history'), opts(noremap, silent) },
	{ '<leader>fd', cmd('Telescope diagnostics'), opts(noremap, silent) },
	{ '<leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
	{ '<leader>fg', cmd('Telescope git_files'), opts(noremap, silent) },
	{ '<leader>fh', cmd('Telescope help_tags'), opts(noremap, silent) },
	{ '<leader>fk', cmd('Telescope keymaps'), opts(noremap, silent) },
	{ '<leader>fo', cmd('Telescope oldfiles'), opts(noremap, silent) },
	{ '<leader>fw', cmd('Telescope grep_string'), opts(noremap, silent) },
	{ '<leader>gbb', cmd('Telescope git_bcommits'), opts(noremap, silent) },
	{ '<leader>gb', cmd('Telescope git_branches'), opts(noremap, silent) },
	{ '<leader>gc', cmd('Telescope git_commits'), opts(noremap, silent) },
	{ '<leader>gs', cmd('Telescope git_status'), opts(noremap, silent) },
	{ '<leader>gst', cmd('Telescope git_stash'), opts(noremap, silent) },
	{ '<leader>man', cmd('Telescope man_pages'), opts(noremap, silent) },
})
