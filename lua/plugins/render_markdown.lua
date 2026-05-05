---@module 'lazy.types'
---@type LazySpec
return {
	'MeanderingProgrammer/render-markdown.nvim',
	desc = 'Plugin to improve viewing Markdown files in Neovim',
	enabled = true,

	ft = { 'gitcomit', 'markdown', 'mdx' },

	keys = {
		{ '<leader>tl', '<cmd>RenderMarkdown toggle<cr>', desc = '[T]oggle [L]ive Preview' },
	},

	opts = function()
		local disabled = { enabled = false }

		---@module 'render-markdown'
		---@type render.md.UserConfig
		return {
			anti_conceal = disabled,
			heading = { enabled = false, icons = { '# ', '## ', '### ', '### ', '#### ', '##### ', '###### ' } },
			sign = disabled,

			debounce = nkl.g.timeout,
			file_types = { 'gitcomit', 'markdown', 'mdx' },
			render_modes = { 'n', 'i', 'v', 'V', 'c', 't' },

			win_options = {
				concealcursor = { rendered = 'n' },
			},
			bullet = {
				icons = { '•' },
			},
			callout = {
				cite = { rendered = ' Cite' },
				quote = { rendered = ' Quote' },
				tldr = { rendered = '󰨸 TLDR' },
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
					ninety_nine = { highlight = 'RenderMarkdownTodo', raw = '[9]', rendered = '󰪤 ' },
					sixty_six = { highlight = 'RenderMarkdownTodo', raw = '[6]', rendered = '󰪢 ' },
					thirty_three = { highlight = 'RenderMarkdownTodo', raw = '[3]', rendered = '󰪠 ' },

					canceled = { highlight = 'Error', raw = '[-]', rendered = ' ' },
					todo = { highlight = 'Error', raw = '[-]', rendered = ' ' },
				},
			},
			code = {
				border = 'thin',
			},
			completions = { blink = { enabled = true } },
			link = {
				email = ' ',
				hyperlink = ' ',
				image = '󰈟 ',
				custom = {
					discord = { icon = ' ', pattern = 'discord%.com' },
					drive = { icon = ' ', pattern = 'drive.google%.com' },
					github = { icon = ' ', pattern = 'github%.com' },
					google = { pattern = 'google%.com', icon = ' ' },
					instagram = { pattern = 'instagram%.com', icon = '󰋾 ' },
					neovim = { icon = ' ', pattern = 'neovim%.io' },
					notion = { icon = ' ', pattern = 'notion%.so' },
					notion_site = { icon = ' ', pattern = '%notion%.site' },
					reddit = { icon = ' ', pattern = 'reddit%.com' },
					stackoverflow = { icon = '󰓌 ', pattern = 'stackoverflow%.com' },
					udemy = { icon = ' ', pattern = 'udemy%.com' },
					web = { icon = ' ', pattern = '^http' },
					wikipedia = { pattern = 'wikipedia%.org', icon = ' ' },
					youtube = { icon = ' ', pattern = 'youtube%.com' },
				},
			},
		}
	end,
}
