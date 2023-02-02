return {
	'ThePrimeagen/harpoon',
	keys = function()
		return {
			{
				'<leader>a',
				function()
					require('harpoon.mark').add_file()
				end,
				desc = 'Add file to harpoon',
			},
			{
				'<C-e>',
				function()
					require('harpoon.ui').toggle_quick_menu()
				end,
				desc = 'Show harpoon marks',
			},
			{
				'<leader>1',
				function()
					require('harpoon.ui').nav_file(1)
				end,
				desc = 'Navigation to file 1',
			},
			{
				'<leader>2',
				function()
					require('harpoon.ui').nav_file(2)
				end,
				desc = 'Navigation to file 2',
			},
			{
				'<leader>3',
				function()
					require('harpoon.ui').nav_file(3)
				end,
				desc = 'Navigation to file 3',
			},
			{
				'<leader>4',
				function()
					require('harpoon.ui').nav_file(4)
				end,
				desc = 'Navigation to file 4',
			},
			{
				'<leader>5',
				function()
					require('harpoon.ui').nav_file(5)
				end,
				desc = 'Navigation to file 5',
			},
		}
	end,
	config = function()
		require('harpoon').setup()
	end,
}
