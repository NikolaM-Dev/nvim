vim.opt_local.conceallevel = 2
vim.opt_local.spell = false
vim.opt_local.wrap = true

vim.keymap.set('n', 'gd', function()
	if require('obsidian').util.cursor_on_markdown_link() then
		return '<cmd>ObsidianFollowLink<CR>'
	else
		return 'gd'
	end
end, { noremap = false, expr = true })
