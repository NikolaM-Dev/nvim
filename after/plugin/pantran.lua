local status_ok, pantran = pcall(require, 'pantran')
if not status_ok then
	return
end

local keymap = require('core.keymap')

local cmd = keymap.cmd
local expr, noremap, silent = keymap.expr, keymap.noremap, keymap.silent
local nmap, xmap = keymap.nmap, keymap.xmap
local opts = keymap.new_opts

pantran.setup({
	default_engine = 'google',
	engines = {
		google = {
			fallback = {
				default_source = 'es',
				default_target = 'en',
			},
		},
	},
	window = {
		window_config = {
			border = 'rounded',
		},
	},
})

nmap({
	{
		'<leader>tll',
		function()
			return pantran.motion_translate() .. '_'
		end,
		opts(noremap, silent),
	},
	{ '<leader>t', cmd('Pantran'), opts(noremap, silent) },
	{ '<leader>tl', pantran.motion_translate, opts(expr, noremap, silent) },
})

xmap({ '<leader>tl', pantran.motion_translate, opts(expr, noremap, silent) })
