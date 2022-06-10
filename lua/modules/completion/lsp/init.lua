local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
	return
end

require('modules.completion.lsp.lsp-installer')
require('modules.completion.lsp.handlers').setup()
