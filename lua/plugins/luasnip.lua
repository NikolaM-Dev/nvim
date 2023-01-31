return {
	{
		'L3MON4D3/LuaSnip',
		build = 'make install_jsregexp',
		config = function()
			require('luasnip').config.set_config({
				history = true,
				delete_check_events = 'TextChanged',
			})

			require('luasnip.loaders.from_vscode').lazy_load({ paths = { './snippets/' } })
		end,
	},
}
