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

---Set a keymap for buffer
---@param mode string|string[]
---@param lhs string
---@param rhs string|function
---@param opts? vim.keymap.set.Opts
function M.bmap(mode, lhs, rhs, opts)
	opts = vim.tbl_extend('force', {
		buffer = true,
		nowait = true,
		silent = true,
	}, opts or {})

	vim.keymap.set(mode, lhs, rhs, opts)
end

---Deletes a keymap
---It's useful to remove [Neovim Default Keymaps](https://neovim.io/doc/user/vim_diff.html#default-mappings)
---@param mode string|string[]
---@param lhs string
function M.dmap(mode, lhs)
	vim.keymap.del(mode, lhs)
end

---Create an autogroup with nikola prefix
---@param name string The name of the autogroup
function M.augroup(name)
	return vim.api.nvim_create_augroup('nikola_' .. name, { clear = true })
end

return M
