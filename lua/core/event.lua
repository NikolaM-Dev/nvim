-- Lua: Stylua format
-- vim.api.nvim_create_autocmd('BufWritePre', { pattern = { '*.lua' }, command = 'stylua .' })

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
