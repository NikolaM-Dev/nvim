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

vim.keymap.set({ 'i', 's' }, '<C-l>', function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end)

vim.keymap.set({ 'i', 's' }, '<C-h>', function()
	if luasnip.choice_active() then
		luasnip.change_choice(-1)
	end
end)
