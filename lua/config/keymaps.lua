local function keymap(mode, lhs, rhs, opts)
	local keys = require('lazy.core.handler').handlers.keys

	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

keymap('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', { expr = true, silent = true })
keymap('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', { expr = true, silent = true })
