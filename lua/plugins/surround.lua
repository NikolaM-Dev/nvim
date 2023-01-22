return {
	'kylechui/nvim-surround',
	event = 'VeryLazy',
	config = function()
		local config = require('nvim-surround.config')

		-- Factory that returns function that surrounds key with a given character
		local add_key_surround = function(surround_key)
			return function()
				local container = config.get_input('Enter object name: ')
				if container then
					return { { container .. '[' .. surround_key }, { surround_key .. ']' } }
				end
			end
		end

		-- Matches reference to table key, e.g. foo["bar"] -> 'foo["]' , '"]'
		local quoted_pattern = [=[([%w_]+%[["'])()[^"']*(["']%])()]=]
		--  Indirect referernces: foo[bar] -> 'foo[", "]'
		local unquoted_pattern = [=[([%w_]+%[)()[^]]+(%])()]=]
		local quoted_surround = add_key_surround([["]])
		local unquoted_surround = add_key_surround('')

		require('nvim-surround').setup({

			keymaps = { -- vim-surround style keymaps
				insert = '<C-g>s',
				insert_line = '<C-g>S',
				normal = 'ys',
				normal_cur = 'yss',
				normal_line = 'yS',
				normal_cur_line = 'ySS',
				visual = 'gs',
				visual_line = 'gS',
				delete = 'ds',
				change = 'cs',
			},
			highlight = {
				duration = 0,
			},
			move_cursor = 'begin',
			surrounds = {
				['k'] = {
					add = quoted_surround,
					find = quoted_pattern,
					delete = quoted_pattern,
					change = {
						target = quoted_pattern,
					},
				},
				['K'] = {
					add = unquoted_surround,
					find = unquoted_pattern,
					delete = unquoted_pattern,
					change = {
						target = unquoted_pattern,
					},
				},
				--markdown link from clipboard
				['l'] = {
					add = function()
						local clipboard = vim.fn.getreg('+'):gsub('\n', '')
						return {
							{ '[' },
							{ '](' .. clipboard .. ')' },
						}
					end,
					find = '%b[]%b()',
					delete = '^(%[)().-(%]%b())()$',
					change = {
						target = '^()()%b[]%((.-)()%)$',
						replacement = function()
							local clipboard = vim.fn.getreg('+'):gsub('\n', '')
							return {
								{ '' },
								{ clipboard },
							}
						end,
					},
				},
				--- markdown italic
				['*'] = {
					find = '(%*+).-(%*+)',
					delete = '^(%*+)().-(%*+)()$',
				},
				-- markdown bold
				['M'] = {
					add = { '**', '**' },
					find = '%*%*.-%*%*',
					delete = '^(%*%*?)().-(%*%*?)()$',
					change = {
						target = '^(%*%*?)().-(%*%*?)()$',
					},
				},
				-- fenced R
				['R'] = {
					add = { '```{r}', '```' },
				},
				-- fenced python
				['P'] = {
					add = { '```{python}', '```' },
				},
			},
			aliases = {
				['m'] = { '`', '*', '_' },
			},
		})
	end,
}
