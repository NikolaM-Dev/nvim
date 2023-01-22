return {

	-- Notification provider
	{
		'rcarriga/nvim-notify',
		keys = {
			{
				'<leader>nc',
				function()
					require('notify').dismiss({ silent = true, pending = true })
				end,
				desc = 'Clear all Notifications',
			},
		},
		opts = {
			timeout = 0,
			render = 'minimal',
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
	},

	-- UI to rename items incrementally
	{
		'smjonas/inc-rename.nvim',
		cmd = 'IncRename',
		config = true,
	},

	-- Floating filename

	-- Fancy select and input dialogs
	{
		'stevearc/dressing.nvim',
		init = function()
			vim.ui.select = function(...)
				require('lazy').load({ plugins = { 'dressing.nvim' } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require('lazy').load({ plugins = { 'dressing.nvim' } })
				return vim.ui.input(...)
			end
		end,
	},

	-- Show available code actions as lightbulb character
	-- {
	-- 	'kosayoda/nvim-lightbulb',
	-- 	opts = {
	-- 		autocmd = {
	-- 			enabled = true,
	-- 		},
	-- 		sign = {
	-- 			enabled = false,
	-- 		},
	-- 		status_text = {
	-- 			enabled = true,
	-- 		},
	-- 	},
	-- 	event = 'BufReadPost',
	-- },

	-- Indent guides
	{
		'lukas-reineke/indent-blankline.nvim',
		event = 'BufReadPost',
		opts = {
			char = '│',
			filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'NvimTree', 'Trouble', 'lazy' },
			show_trailing_blankline_indent = false,
			show_current_context = false,
			buftype_exclude = { 'terminal', 'nofile' },
		},
	},

	-- Dashboard
	{
		'goolord/alpha-nvim',
		event = 'VimEnter',
		config = function()
			local dashboard = require('alpha.themes.dashboard')
			local logo = [[
       ___       __   ___  ___  ________  _________       ___  ___  ________  ___  ___  ___
      |\  \     |\  \|\  \|\  \|\   __  \|\___   ___\    |\  \|\  \|\   __  \|\  \|\  \|\  \
      \ \  \    \ \  \ \  \\\  \ \  \|\  \|___ \  \_|    \ \  \\\  \ \  \|\  \ \  \ \  \ \  \
       \ \  \  __\ \  \ \   __  \ \   __  \   \ \  \      \ \  \\\  \ \   ____\ \  \ \  \ \  \
        \ \  \|\__\_\  \ \  \ \  \ \  \ \  \   \ \  \      \ \  \\\  \ \  \___|\ \__\ \__\ \__\
         \ \____________\ \__\ \__\ \__\ \__\   \ \__\      \ \_______\ \__\    \|__|\|__|\|__|
          \|____________|\|__|\|__|\|__|\|__|    \|__|       \|_______|\|__|        ___  ___  ___
                                                                                   |\__\|\__\|\__\
                                                                                   \|__|\|__|\|__|
   ]]

			dashboard.section.header.val = vim.split(logo, '\n')
			dashboard.section.buttons.val = {
				dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
				dashboard.button('e', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
				dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
				dashboard.button('t', ' ' .. ' Find text', ':Telescope live_grep <CR>'),
				dashboard.button('c', ' ' .. ' Config', ':e $MYVIMRC <CR>'),
				dashboard.button('p', ' ' .. ' Open Project', ':Telescope projects<CR>'),
				dashboard.button('l', '鈴 ' .. ' Lazy', ':Lazy<CR>'),
				dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = 'Type'
				button.opts.hl_shortcut = 'Constant'
			end
			dashboard.section.footer.opts.hl = 'Function'
			dashboard.section.header.opts.hl = 'Keyword'
			dashboard.section.buttons.opts.hl = 'Type'
			dashboard.opts.layout[1].val = 8

			local alpha = require('alpha')
			if vim.o.filetype == 'lazy' then
				-- close and re-open Lazy after showing alpha
				vim.cmd.close()
				alpha.setup(dashboard.opts)
				require('lazy').show()
			else
				alpha.setup(dashboard.opts)
			end

			vim.api.nvim_create_autocmd('User', {
				pattern = 'LazyVimStarted',
				callback = function()
					local stats = require('lazy').stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = '💪 Neovim loaded '
						.. stats.count
						.. ' plugins in '
						.. ms
						.. 'ms 💪'
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},

	-- icons
	'nvim-tree/nvim-web-devicons',
}
