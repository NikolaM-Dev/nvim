local status_ok, go = pcall(require, 'go')
if not status_ok then
	return
end

go.setup({
	goimport = 'gopls', -- if set to 'gopls' will use golsp format
	gofmt = 'gopls', -- if set to gopls will use golsp format
	max_line_len = 120,
	tag_transform = false,
	test_dir = '',
	comment_placeholder = '   ',
	lsp_cfg = true, -- false: use your own lspconfig
	lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
	lsp_on_attach = true, -- use on_attach from go.nvim
	dap_debug = false,
})
