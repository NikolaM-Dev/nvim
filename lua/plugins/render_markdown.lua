---@module 'lazy.types'
---@type LazySpec
return {
	'MeanderingProgrammer/render-markdown.nvim',
	desc = 'Plugin to improve viewing Markdown files in Neovim',
	enabled = true,

	ft = { 'gitcomit', 'markdown', 'mdx' },

	keys = {
		{ '<M-l>', '<cmd>RenderMarkdown toggle<cr>', desc = '[T]oggle [L]ive Preview' },
	},

	opts = function()
		local disabled = { enabled = false }

		---@module 'render-markdown'
		---@type render.md.UserConfig
		return {
			anti_conceal = disabled,
			heading = disabled,
			sign = disabled,

			debounce = 42,
			file_types = { 'gitcomit', 'markdown', 'mdx' },
			render_modes = { 'n', 'i', 'v', 'V', 'c', 't' },

			win_options = {
				concealcursor = { rendered = 'n' },
			},
			bullet = {
				icons = { '•' },
			},
			checkbox = {
				bullet = true,
				checked = {
					icon = ' ',
				},
				unchecked = {
					icon = ' ',
				},
				custom = {
					cancelled = { highlight = 'RenderMarkdownTodo', raw = '[-]', rendered = ' ' },
					ninety_nine = { highlight = 'RenderMarkdownTodo', raw = '[9]', rendered = '󰪤 ' },
					sixty_six = { highlight = 'RenderMarkdownTodo', raw = '[6]', rendered = '󰪢 ' },
					thirty_three = { highlight = 'RenderMarkdownTodo', raw = '[3]', rendered = '󰪠 ' },
				},
			},
			completions = { blink = { enabled = true } },
			link = {
				email = ' ',
				hyperlink = ' ',
				image = '󰈟 ',
				custom = {
					discord = { icon = '󰙯 ', pattern = 'discord%.com' },
					drive = { icon = ' ', pattern = 'drive.google%.com' },
					github = { icon = '󰊤 ', pattern = 'github%.com' },
					neovim = { icon = ' ', pattern = 'neovim%.io' },
					reddit = { icon = '󰑍 ', pattern = 'reddit%.com' },
					stackoverflow = { icon = '󰓌 ', pattern = 'stackoverflow%.com' },
					udemy = { icon = ' ', pattern = 'udemy%.com' },
					web = { icon = ' ', pattern = '^http' },
					youtube = { icon = '  ', pattern = 'youtube%.com' },
				},
			},
		}
	end,
}
