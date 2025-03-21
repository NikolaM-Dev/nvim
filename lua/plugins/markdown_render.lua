---@type LazySpec
return {
	'MeanderingProgrammer/render-markdown.nvim',
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
					drive = { icon = ' ', pattern = 'drive.google%.com' },
					github = { icon = '󰊤 ', pattern = 'github%.com' },
					neovim = { icon = ' ', pattern = 'neovim%.io' },
					reddit = { icon = '󰑍 ', pattern = 'reddit%.com' },
					stackoverflow = { icon = '󰓌 ', pattern = 'stackoverflow%.com' },
					udemy = { icon = '󰰩 ', pattern = 'udemy%.com' },
					web = { icon = ' ', pattern = '^http' },
					youtube = { icon = '  ', pattern = 'youtube%.com' },
				},
			},
		}
	end,
}
