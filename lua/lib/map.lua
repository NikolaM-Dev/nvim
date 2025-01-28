---@class NMap
local NMap = {}

---Adds a new |mapping|. By default with silent mode active
---@param mode string|string[] Mode short-name, see |nvim_set_keymap()|.
---							   Can also be list of modes to create mapping on multiple modes.
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts? vim.keymap.set.Opts
function NMap.set(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false

	return vim.keymap.set(mode, lhs, rhs, opts)
end

---@class NMapCmdOpts
---@field delay_cmd? boolean defaults to false
---@field use_esc? boolean defaults to false

-- TODO: Make a example

---Constructs a command string based on the provided `cmd` and options.
---@param cmd string command to be executed.
---@param opts? NMapCmdOpts table containing options for the command.
--- The `delay_cmd` option determines whether the command is delayed (default is `false`).
--- If `delay_cmd` is `true`, returns the command prefixed with a colon `:`.
--- Otherwise, returns the command wrapped with `<cmd>` and `<cr>`.
---@return string constructed command string based on the options provided.
function NMap.cmd(cmd, opts)
	opts = opts or {
		delay_cmd = false,
		use_esc = false,
	}

	if opts.delay_cmd then
		return ':' .. cmd
	end

	if opts.use_esc then
		return '<esc><cmd>' .. cmd .. '<cr>'
	end

	return '<cmd>' .. cmd .. '<cr>'
end

function NMap.toggle_opt(opt, on, off, name)
	local logger = n.logger:new('Options')

	if vim.opt[opt]:get() == off then
		vim.opt[opt] = on
		logger:info(name .. ' Enabled')

		return
	end

	vim.opt[opt] = off
	logger:warn(name .. ' Disabled')
end

return NMap
