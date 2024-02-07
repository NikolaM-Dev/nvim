return {
	'ThePrimeagen/harpoon',
	keys = function()
		local keys = {}

		table.insert(keys, {
			'<C-e>',
			function()
				require('harpoon.ui').toggle_quick_menu()
			end,
			desc = 'Show harpoon marks',
		})

		table.insert(keys, {
			'<leader>a',
			function()
				require('harpoon.mark').add_file()
			end,
			desc = '[A]dd file to harpoon',
		})

		for i = 1, 9 do
			table.insert(keys, {
				string.format('<leader>%s', i),
				function()
					require('harpoon.ui').nav_file(i)
				end,
				desc = 'Harpoon go to file ' .. i,
			})
		end

		return keys
	end,
	config = function()
		require('harpoon').setup({
			menu = {
				width = 80,
			},
		})
	end,
}
