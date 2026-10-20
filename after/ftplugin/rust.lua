nkl.opt.indent(4, 'spaces')

vim.opt_local.colorcolumn = '100'

local bmap = nkl.key.bmap

---@param args string|table
---@return fun()
local function rust_lsp(args)
	return function()
		vim.cmd.RustLsp(args)
	end
end

---@param lhs string
---@param args string|table
---@param desc string
local function rust_lsp_map(lhs, args, desc)
	bmap('n', lhs, rust_lsp(args), { desc = desc })
end

local function toggle_inlay_hints()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
end

-- stylua: ignore start
bmap('n', '<leader>R',  '',                                       { desc = '+rust' })

rust_lsp_map('<leader>Rr', 'run',                                 'Run target under cursor')
rust_lsp_map('<leader>RR', 'runnables',                           'Run target (picker)')
rust_lsp_map('<leader>Rl', { 'runnables', bang = true },          'Run last target')
rust_lsp_map('<leader>Rt', 'testables',                           'Run tests (picker)')
rust_lsp_map('<leader>RT', { 'testables', bang = true },          'Re-run last test')

rust_lsp_map('<leader>Rd', 'debug',                               'Debug target under cursor')
rust_lsp_map('<leader>RD', 'debuggables',                         'Debug target (picker)')

rust_lsp_map('<leader>Rc', 'codeAction',                          'Code action (grouped)')
rust_lsp_map('<leader>Re', 'explainError',                        'Explain error code')
rust_lsp_map('<leader>RE', 'renderDiagnostic',                    'Render diagnostic')
rust_lsp_map('<leader>Rh', { 'hover', 'actions' },                'Hover actions')

rust_lsp_map('<leader>Rm', 'expandMacro',                         'Expand macro')
rust_lsp_map('<leader>Rb', 'rebuildProcMacros',                   'Rebuild proc macros')
rust_lsp_map('<leader>RJ', 'joinLines',                           'Join lines')
rust_lsp_map('<leader>Rj', { 'moveItem', 'down' },                'Move item down')
rust_lsp_map('<leader>Rk', { 'moveItem', 'up' },                  'Move item up')

rust_lsp_map('<leader>Ro', 'openDocs',                            'Open docs.rs')
rust_lsp_map('<leader>RC', 'openCargo',                           'Open Cargo.toml')
rust_lsp_map('<leader>Rp', 'parentModule',                        'Go to parent module')
rust_lsp_map('<leader>Rw', 'workspaceSymbol',                     'Workspace symbols')

bmap('n', '<leader>Ri', toggle_inlay_hints,                       { desc = 'Toggle inlay hints' })
-- stylua: ignore end
