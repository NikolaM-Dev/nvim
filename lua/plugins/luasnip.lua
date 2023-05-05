return {
	'L3MON4D3/LuaSnip',
	build = 'make install_jsregexp',
	config = function()
		require('luasnip').setup({
			history = true,
			delete_check_events = { 'TextChanged', 'TextChangedI' },
			region_check_events = { 'CursorMoved', 'CursorMovedI' },
		})

		require('luasnip.loaders.from_vscode').lazy_load({ paths = { './snippets' } })
	end,
}
