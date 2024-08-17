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
			sign = disabled,

			bullet = {
				icons = { '•' },
			},
			link = {
				image = '󰈟 ',
				},
			},
		}
	end,

	---@param opts render.md.UserConfig
	config = function(_, opts)
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

		require('render-markdown').setup(opts)
	end,
}
