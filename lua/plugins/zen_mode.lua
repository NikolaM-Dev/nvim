return {
	'folke/zen-mode.nvim',
	enabled = false,
	keys = {
		{ '<leader>zm', '<cmd>ZenMode<cr>', desc = 'Toggle [Z]en [M]ode' },
	},
	config = function()
		require('zen-mode').setup({
			window = {
				backdrop = 0.95,
				height = 1,
				options = { colorcolumn = '', signcolumn = 'no' },
				width = 80,
			},
			plugins = {
				alacritty = { enabled = true, font = '13' },
				gitsigns = { enabled = false },
				options = { enabled = true, laststatus = 0, ruler = false, showcmd = false },
				tmux = { enabled = true },
				twilight = { enabled = false },
			},
			-- Change alacritty font y offset when zen mode is activated
			on_open = function()
				if not vim.fn.executable('alacritty') then
					return
				end

				local cmd = 'alacritty msg config -w %s font.offset.y=6'
				local win_id = vim.fn.expand('$ALACRITTY_WINDOW_ID')

				vim.fn.system(cmd:format(win_id))
				vim.cmd([[redraw]])
			end,
			-- Reset alacritty offset when zen mode is deactivated
			on_close = function()
				if not vim.fn.executable('alacritty') then
					return
				end

				local cmd = 'alacritty msg config -w %s --reset'
				local win_id = vim.fn.expand('$ALACRITTY_WINDOW_ID')

				vim.fn.system(cmd:format(win_id))
				vim.cmd([[redraw]])
			end,
		})
	end,
}
