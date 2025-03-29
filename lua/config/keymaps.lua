vim.g.mapleader = ' '

---@param mode string|string[]
---@param lhs string
---@param rhs string|function
---@param opts? vim.keymap.set.Opts
local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false

	return vim.keymap.set(mode, lhs, rhs, opts)
end
map('i', '!', '!<c-g>u', { desc = 'Add undo break after type !' })
map('i', ',', ',<c-g>u', { desc = 'Add undo break after type ,' })
map('i', '-', '-<c-g>u', { desc = 'Add undo break after type -' })
map('i', '.', '.<c-g>u', { desc = 'Add undo break after type .' })
map('i', ';', ';<c-g>u', { desc = 'Add undo break after type ;' })
map('i', '?', '?<c-g>u', { desc = 'Add undo break after type ?' })
map('i', '_', '_<c-g>u', { desc = 'Add undo break after type _' })
map('n', 'o', 'o<c-g>u', { desc = 'Add undo break after type o' })
