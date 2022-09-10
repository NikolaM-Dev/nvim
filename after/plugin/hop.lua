local status_ok, hop = pcall(require, 'hop')
if not status_ok then
	return
end

local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local opts = keymap.new_opts
local noremap = keymap.noremap

hop.setup({ keys = 'etovxqpdygfblzhckisuran' })

nmap({
	{ 'f', cmd('HopWord'), opts(noremap) },
	{ 'F', cmd('HopChar2'), opts(noremap) },
})
