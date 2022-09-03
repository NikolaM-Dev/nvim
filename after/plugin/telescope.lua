local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
	return
end

telescope.setup()

local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local opts = keymap.new_opts
local silent, noremap = keymap.silent, keymap.noremap

nmap({
	{ '<Leader>b', cmd('Telescope buffers'), opts(noremap, silent) },
	{ '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
	{ '<Leader>fb', cmd('Telescope file_browser'), opts(noremap, silent) },
	{ '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
	{ '<Leader>fg', cmd('Telescope gif_files'), opts(noremap, silent) },
	{ '<Leader>fh', cmd('Telescope help_tags'), opts(noremap, silent) },
	{ '<Leader>fo', cmd('Telescope oldfiles'), opts(noremap, silent) },
	{ '<Leader>fw', cmd('Telescope grep_string'), opts(noremap, silent) },
	{ '<Leader>gbc', cmd('Telescope git_bcommits'), opts(noremap, silent) },
	{ '<Leader>gb', cmd('Telescope git_branches'), opts(noremap, silent) },
	{ '<Leader>gc', cmd('Telescope git_commits'), opts(noremap, silent) },
	{ '<Leader>gs', cmd('Telescope git_status'), opts(noremap, silent) },
	{ '<Leader>gst', cmd('Telescope git_stash'), opts(noremap, silent) },
	{ '<Leader>man', cmd('Telescope man_pages'), opts(noremap, silent) },
})
