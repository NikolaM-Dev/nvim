return {
	'lukas-reineke/headlines.nvim',
	ft = 'markdown',
	dependencies = { 'catppuccin/nvim', 'nvim-treesitter/nvim-treesitter' },
	config = function()
		local PALETTE = require('catppuccin.palettes').get_palette('mocha')

		local headline_fg = '#2B2B2B'
		local marker_fg = PALETTE.surface2

		vim.api.nvim_set_hl(0, 'Headline1', { bg = PALETTE.red, fg = headline_fg })
		vim.api.nvim_set_hl(0, 'Headline2', { bg = PALETTE.peach, fg = headline_fg })
		vim.api.nvim_set_hl(0, 'Headline3', { bg = PALETTE.green, fg = headline_fg })
		vim.api.nvim_set_hl(0, 'Headline4', { bg = PALETTE.teal, fg = headline_fg })
		vim.api.nvim_set_hl(0, 'Headline5', { bg = PALETTE.lavender, fg = headline_fg })
		vim.api.nvim_set_hl(0, 'Headline6', { bg = PALETTE.mauve, fg = headline_fg })

		vim.api.nvim_set_hl(0, 'CodeBlock', { bg = PALETTE.crust })

		vim.api.nvim_set_hl(0, 'Dash', { fg = PALETTE.blue })
		vim.api.nvim_set_hl(0, '@markup.italic', { fg = PALETTE.green, italic = true })
		vim.api.nvim_set_hl(0, '@markup.strong', { bold = true, fg = PALETTE.red })
		vim.api.nvim_set_hl(0, 'Quote', { fg = PALETTE.overlay2 })

		vim.api.nvim_set_hl(0, '@text.title.1.marker.markdown', { fg = marker_fg })
		vim.api.nvim_set_hl(0, '@text.title.2.marker.markdown', { fg = marker_fg })
		vim.api.nvim_set_hl(0, '@text.title.3.marker.markdown', { fg = marker_fg })
		vim.api.nvim_set_hl(0, '@text.title.4.marker.markdown', { fg = marker_fg })
		vim.api.nvim_set_hl(0, '@text.title.5.marker.markdown', { fg = marker_fg })
		vim.api.nvim_set_hl(0, '@text.title.6.marker.markdown', { fg = marker_fg })

		vim.schedule(function()
			local headlines = require('headlines')

			headlines.setup({
				markdown = {
					bullet_highlights = {
						'@text.title.1.marker.markdown',
						'@text.title.2.marker.markdown',
						'@text.title.3.marker.markdown',
						'@text.title.4.marker.markdown',
						'@text.title.5.marker.markdown',
						'@text.title.6.marker.markdown',
					},
					-- bullets = { '󰇊', '󰇋', '󰇌', '󰇍', '󰇎', '󰇏' },
					bullets = { '󰉫', '󰉬', '󰉭', '󰉮', '󰉯', '󰉰' },
					codeblock_highlight = 'CodeBlock',
					dash_highlight = 'Dash',
					-- dash_string = '⎯',
					dash_string = '󰇘',
					fat_headline_lower_string = '🬂',
					fat_headlines = false,
					fat_headline_upper_string = '▃',
					headline_highlights = {
						'Headline1',
						'Headline2',
						'Headline3',
						'Headline4',
						'Headline5',
						'Headline6',
					},
					quote_highlight = 'Quote',
					quote_string = '',
				},
			})

			local markdwon_config = headlines.config.markdown
			headlines.refresh()

			vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
				desc = 'Toggle headlines.nvim on insert enter/leave',
				group = _G.augroup('toggle_headlines.nvim_on_insert_enter_leave'),
				callback = function(data)
					if vim.bo.filetype == 'markdown' then
						headlines.config.markdown = data.event == 'InsertLeave' and markdwon_config or nil
						headlines.refresh()
					end
				end,
			})
		end)
	end,
}
