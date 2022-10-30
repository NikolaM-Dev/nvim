local status_ok, hop = pcall(require, 'hop')
if not status_ok then
	return
end

local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap, vmap = keymap.nmap, keymap.vmap
local noremap = keymap.noremap
local opts = keymap.new_opts

hop.setup({ keys = 'asdfjkl;ghqweruiopty' })

nmap({ 'f', cmd('HopWord'), opts(noremap) })

vmap({ 'f', cmd('HopWord'), opts(noremap) })
