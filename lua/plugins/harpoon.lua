---@module 'lazy'
---@type LazySpec
return {
	'ThePrimeagen/harpoon',
	desc = 'Getting you where you want with the fewest keystrokes',
	enabled = true,

	branch = 'harpoon2',

	keys = function()
		local harpoon = require('harpoon')

		local keys = {
			{
				'<C-e>',
				function()
					harpoon.ui:toggle_quick_menu(harpoon:list(), { title = '  Harpoon ' })
				end,
				desc = '[H]arpoon Toogle  Quick Menu',
			},
			{
				'<leader>a',
				function()
					harpoon:list():add()
				end,
				desc = 'Harpoon [A]dd file to list',
			},
		}

		for i = 1, 5 do
			table.insert(keys, {
				'<leader>' .. i,
				function()
					harpoon:list():select(i)
				end,
				desc = 'Harpoon select file in position [' .. i .. ']',
			})
		end

		return keys
	end,

	---@type table
	opts = {
		settings = {
			save_on_toggle = true,
		},
	},
}
