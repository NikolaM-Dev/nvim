---@type LazySpec
return {
	'MeanderingProgrammer/markdown.nvim',
	enabled = true,

	cmd = 'RenderMarkdown',
	main = 'render-markdown',
	name = 'render-markdown',
	ft = { 'markdown' },

	opts = function()
		local disabled = { enabled = false }

		---@type render.md.UserConfig
		return {
			heading = disabled,
			render_modes = { 'n', 'c', 't' },
			sign = disabled,

			bullet = {
				icons = { '•' },
			},
			callout = {
				quote = {
					rendered = ' Quote',
				},
			},
			checkbox = {
				checked = {
					icon = ' ',
				},
				unchecked = {
					icon = ' ',
				},
				custom = {
					thirty_three = { raw = '[3]', rendered = '󰪠 ', highlight = 'RenderMarkdownTodo' },
					sixty_six = { raw = '[6]', rendered = '󰪢 ', highlight = 'RenderMarkdownTodo' },
					ninety_nine = { raw = '[9]', rendered = '󰪤 ', highlight = 'RenderMarkdownTodo' },
				},
			},
			link = {
				image = '󰈟 ',
				custom = {
					discord = { icon = '󰙯 ', pattern = 'discord%.com' },
					github = { icon = '󰊤 ', pattern = 'github%.com' },
					neovim = { icon = ' ', pattern = 'neovim%.io' },
					reddit = { icon = '󰑍 ', pattern = 'reddit%.com' },
					stackoverflow = { icon = '󰓌 ', pattern = 'stackoverflow%.com' },
					web = { icon = ' ', pattern = '^http' },
					youtube = { icon = '  ', pattern = 'youtube%.com' },
					udemy = { icon = '󰰩 ', pattern = 'udemy%.com' },
				},
			},
		}
	end,

	---@param opts render.md.UserConfig
	config = function(_, opts)
		if theme == 'catppuccin' then
			local PALETTE = require('catppuccin.palettes').get_palette('mocha')

			vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = PALETTE.crust })
			vim.api.nvim_set_hl(0, 'RenderMarkdownCodeInline', { fg = PALETTE.sky })
			vim.api.nvim_set_hl(0, 'RenderMarkdownDash', { fg = PALETTE.blue })

			local colors = {
				PALETTE.red,
				PALETTE.peach,
				PALETTE.green,
				PALETTE.teal,
				PALETTE.lavender,
				PALETTE.mauve,
			}

			for i = 1, 6, 1 do
				local background_highlight = 'RenderMarkdownH' .. i .. 'Bg'
				local foreground_highlight = 'RenderMarkdownH' .. i

				local color = colors[i]

				vim.api.nvim_set_hl(0, background_highlight, { fg = color })
				vim.api.nvim_set_hl(0, foreground_highlight, { fg = color })
			end
		end

		require('render-markdown').setup(opts)
	end,
}
