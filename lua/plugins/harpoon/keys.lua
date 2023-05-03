local M = {
	keys = {},
}

local binds = 5

table.insert(M.keys, {
	'<C-e>',
	function()
		require('harpoon.ui').toggle_quick_menu()
	end,
	desc = 'Show harpoon marks',
})

table.insert(M.keys, {
	'<leader>a',
	function()
		require('harpoon.mark').add_file()
	end,
	desc = '[A]dd file to harpoon',
})

for i = 1, binds do
	table.insert(M.keys, {
		string.format('<leader>%s', i),
		function()
			require('harpoon.ui').nav_file(i)
		end,
		desc = 'Harpoon go to file ' .. i,
	})
end

return M
