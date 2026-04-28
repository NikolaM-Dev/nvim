if not nkl.tmux.is_running() then
	return
end

local augroup = require('lib').augroup
local autocmd, command = vim.api.nvim_create_autocmd, vim.api.nvim_create_user_command

local TMUX_PREFIX = 'C-z'
	or vim.system({
		'tmux',
		'show-options',
		'-g',
		'prefix',
	}, {})
		:wait().stdout
		:match('prefix%s+(%S+)')

local prefix_timer = nil
local prefix_debounce_ms = nkl.g.timeout

local function unset_tmux_prefix()
	if TMUX_PREFIX then
		vim.system({ 'tmux', 'set-option', '-g', 'prefix', 'None' }, {})
	end
end

local function set_tmux_prefix()
	if TMUX_PREFIX then
		vim.system({ 'tmux', 'set-option', '-g', 'prefix', TMUX_PREFIX }, {})
	end
end

local function schedule_set_prefix()
	-- Cancel any pending timer
	if prefix_timer then
		vim.fn.timer_stop(prefix_timer)
		prefix_timer = nil
	end
	-- Schedule new timer to set prefix after debounce delay
	prefix_timer = vim.fn.timer_start(prefix_debounce_ms, function()
		set_tmux_prefix()
		prefix_timer = nil
	end)
end

autocmd({ 'ModeChanged' }, {
	desc = 'Disable tmux prefix in insert mode',
	group = augroup('disable_tmux_leader_in_insert_mode'),
	callback = function(args)
		local new_mode = args.match:sub(-1)
		if new_mode == 'n' or new_mode == 't' then
			schedule_set_prefix()
		else
			unset_tmux_prefix()
			-- Cancel any pending timer if entering another mode
			if prefix_timer then
				vim.fn.timer_stop(prefix_timer)
				prefix_timer = nil
			end
		end
	end,
})

autocmd({ 'FocusGained', 'FocusLost' }, {
	group = augroup('reset_tmux_prefix_on_focus'),
	desc = 'Reset tmux prefix on focus change',
	callback = set_tmux_prefix,
})

autocmd({ 'VimLeave' }, {
	group = augroup('reset_tmux_prefix_on_exit'),
	desc = 'Reset tmux prefix on exit and cleanup timer',
	callback = function()
		-- Cancel any pending timer
		if prefix_timer then
			vim.fn.timer_stop(prefix_timer)
			prefix_timer = nil
		end
		-- Set prefix before exiting
		set_tmux_prefix()
	end,
})

command('TmuxPrefix', function()
	set_tmux_prefix()
end, { desc = '󰘳 Remove all the spaces between lines' })
