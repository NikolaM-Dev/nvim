local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local opts = keymap.new_opts
local noremap = keymap.noremap

nmap({
	{ '<leader>ga', cmd('G add %'), opts(noremap) },
	{ '<leader>gal', cmd('G add --all'), opts(noremap) },
	{ '<leader>gap', cmd('G add % -p'), opts(noremap) },
	{ '<leader>gbm', ':G branch -m ', opts(noremap) },
	{ '<leader>gca', cmd(':G commit --amend'), opts(noremap) },
	{ '<leader>g', cmd(':G'), opts(noremap) },
	{ '<leader>gfa', cmd(':G fetch --all -p'), opts(noremap) },
	{ '<leader>gi', cmd(':G init'), opts(noremap) },
	{ '<leader>gm', ':G merge --no-ff --no-edit ', opts(noremap) },
	{ '<leader>gp', cmd(':G push'), opts(noremap) },
	{ '<leader>gpl', cmd(':G pull'), opts(noremap) },
	{ '<leader>gpo', cmd(':G push origin -u HEAD'), opts(noremap) },
	{ '<leader>gu', ':G reset --soft HEAD~1', opts(noremap) },
	{ '<leader><leader>gst', ':G stash -um ', opts(noremap) },
})
