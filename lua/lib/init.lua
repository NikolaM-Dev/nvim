local M = {}

---Set a keymap and ensure it's unique
---@param mode string|string[]
---@param lhs string
---@param rhs string|function
---@param opts? vim.keymap.set.Opts
function M.map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	opts.unique = true

	pcall(vim.keymap.set, mode, lhs, rhs, opts)
end
return M
