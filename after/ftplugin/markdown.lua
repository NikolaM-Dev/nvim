vim.opt_local.colorcolumn = '0'
vim.opt_local.conceallevel = 3
vim.opt_local.spell = true
vim.opt_local.wrap = true

vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2

-- Search UP for a markdown header
-- Make sure to follow proper markdown convention, and you have a single H1
-- heading at the very top of the file
-- This will only search for H2 headings and above
vim.keymap.set('n', 'gk', function()
	-- `?` - Start a search backwards from the current cursor position.
	-- `^` - Match the beginning of a line.
	-- `##` - Match 2 ## symbols
	-- `\\+` - Match one or more occurrences of prev element (#)
	-- `\\s` - Match exactly one whitespace character following the hashes
	-- `.*` - Match any characters (except newline) following the space
	-- `$` - Match extends to end of line
	vim.cmd('silent! ?^##\\+\\s.*$')
	-- Clear the search highlight
	vim.cmd('nohlsearch')
end, { desc = '[G]o to previous markdown header' })

-- Search DOWN for a markdown header
-- Make sure to follow proper markdown convention, and you have a single H1
-- heading at the very top of the file
-- This will only search for H2 headings and above
vim.keymap.set('n', 'gj', function()
	-- `/` - Start a search forwards from the current cursor position.
	-- `^` - Match the beginning of a line.
	-- `##` - Match 2 ## symbols
	-- `\\+` - Match one or more occurrences of prev element (#)
	-- `\\s` - Match exactly one whitespace character following the hashes
	-- `.*` - Match any characters (except newline) following the space
	-- `$` - Match extends to end of line
	vim.cmd('silent! /^##\\+\\s.*$')
	-- Clear the search highlight
	vim.cmd('nohlsearch')
end, { desc = '[G]o to next markdown header' })
