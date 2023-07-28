local binds = 9
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

for i = 1, binds do
	table.insert(keys, {
		string.format('<leader>%s', i),
		function()
			require('harpoon.ui').nav_file(i)
		end,
		desc = 'Harpoon go to file ' .. i,
	})
end

return {
	'ThePrimeagen/harpoon',
	keys = keys,
	config = function()
		require('harpoon').setup()
	end,
}
