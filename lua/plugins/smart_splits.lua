---@module 'lazy.types'
---@type LazySpec
return {
	'mrjones2014/smart-splits.nvim',
	desc = '🧠 Smart, seamless, directional navigation and resizing of Neovim + terminal multiplexer splits. Supports Zellij, Tmux, Wezterm, and Kitty. Think about splits in terms of "up/down/left/right". ',
	enabled = true,
	cond = function()
		return not nkl.tmux.is_running()
	end,

	keys = {
		-- stylua: ignore start
		{ '<C-h>', '<cmd>lua require("smart-splits").move_cursor_left()<cr>', desc = '  Change Focus to Left Window', mode = { 'n', 't' } },
		{ '<C-j>', '<cmd>lua require("smart-splits").move_cursor_down()<cr>', desc = '  Change Focus to Down Window', mode = { 'n', 't' } },
		{ '<C-k>', '<cmd>lua require("smart-splits").move_cursor_up()<cr>', desc = '  Change Focus to Top Window', mode = { 'n', 't' } },
		{ '<C-l>', '<cmd>lua require("smart-splits").move_cursor_right()<cr>', desc = '  Change Focus to Right Window', mode = { 'n', 't' } },

		{ '<M-h>', '<cmd>lua require("smart-splits").resize_left(2)<cr>', desc = '  Resize pane left', mode = { 'n', 't' } },
    	{ '<M-j>', '<cmd>lua require("smart-splits").resize_down(2)<cr>', desc = '  Resize pane down', mode = { 'n', 't' } },
    	{ '<M-k>', '<cmd>lua require("smart-splits").resize_up(2)<cr>', desc = '  Resize pane up', mode = { 'n', 't' } },
    	{ '<M-l>', '<cmd>lua require("smart-splits").resize_right(2)<cr>', desc = '  Resize pane right', mode = { 'n', 't' } },
		-- stylua: ignore end
	},

	config = true,
}
