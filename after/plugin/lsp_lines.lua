local status_ok, lsp_lines = pcall(require, 'lsp_lines')
if not status_ok then
	return
end

lsp_lines.setup()

local keymap = require('core.keymap')

local nmap = keymap.nmap
local noremap = keymap.noremap
local opts = keymap.new_opts

nmap({
	'<leader>l',
	function()
		lsp_lines.toggle()
	end,
	opts(noremap, 'Toggle lsp_lines'),
})
