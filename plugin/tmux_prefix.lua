if vim.fn.executable('tmux') == 0 then
	return
end

local augroup = require('lib').augroup
local autocmd = vim.api.nvim_create_autocmd

local tmux_prefix = vim.system({ 'tmux', 'show-options', '-g', 'prefix' }, {}):wait().stdout:match('prefix%s+(%S+)')

local function unset_tmux_prefix()
	if tmux_prefix then
		vim.system({ 'tmux', 'set-option', '-g', 'prefix', 'None' }, {})
	end
end

local function set_tmux_prefix()
	if tmux_prefix then
		vim.system({ 'tmux', 'set-option', '-g', 'prefix', tmux_prefix }, {})
	end
end

autocmd({ 'ModeChanged' }, {
	desc = 'Disable tmux prefix in insert mode',
	group = augroup('disable_tmux_leader_in_insert_mode'),
	callback = function(args)
		local new_mode = args.match:sub(-1)
		if new_mode == 'n' or new_mode == 't' then
			set_tmux_prefix()
		else
			unset_tmux_prefix()
		end
	end,
})

autocmd({ 'VimLeave' }, {
	group = augroup('reset_tmux_prefix_on_exit'),
	desc = 'Reset tmux prefix on exit',
	callback = set_tmux_prefix,
})
