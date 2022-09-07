local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
	return
end

luasnip.config.set_config({
	history = true,
	updateevents = 'TextChanged,TextChangedI',
})

pcall(function()
	require('luasnip.loaders.from_vscode').lazy_load({ paths = { './snippets/' } })
end)
