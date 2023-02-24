local M = {}

---@type PluginLspKeys
M._keys = nil

---@return (LazyKeys|{has?:string})[]
function M.get()
	if not M._keys then
		---@class PluginLspKeys
		M._keys = {
			{ '<C-k>', vim.lsp.buf.signature_help, mode = 'i', desc = 'Signature Documentation' },
			-- { 'gd', '<cmd>Telescope lsp_definitions<cr>', desc = '[G]oto [D]efinition' },
			{ 'gD', vim.lsp.buf.declaration, desc = '[G]oto [D]eclaration' },
			{ 'gI', '<cmd>Telescope lsp_implementations<cr>', desc = '[G]oto [I]mplementation' },
			{ 'gr', '<cmd>Telescope lsp_references<cr>', desc = '[G]oto [R]eferences' },
			{ 'K', vim.lsp.buf.hover, desc = 'Hover Documentation' },
			{ '<leader>ca', vim.lsp.buf.code_action, desc = '[C]ode [A]ction' },
			{ '<leader>D', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'Type [D]efinitions' },
			{ '<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', desc = '[D]ocument [S]ymbols' },
			{ '<leader>Ej', M.diagnostic_goto(true, 'ERROR'), desc = 'Next Error' },
			{ '<leader>Ek', M.diagnostic_goto(false, 'ERROR'), desc = 'Prev Error' },
			{ '<leader>K', vim.lsp.buf.hover, desc = 'Hover' },
			{ '<leader>li', '<cmd>LspInfo<cr>', desc = 'Lsp Info' },
			{ '<Leader>ll', '<cmd>LspLog<cr>', desc = 'Lsp Log' },
			{ '<Leader>lr', '<cmd>LspRestart<cr>', desc = 'Lsp Restart' },
			{ '<leader>rn', vim.lsp.buf.rename, desc = '[R]e[n]ame' },
			-- { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = '[S]earch [D]iagnostics' },
			{ '<leader>sd', '<cmd>FzfLua diagnostics_workspace<cr>', desc = '[S]earch [D]iagnostics' },
			{ '<leader>wj', M.diagnostic_goto(true, 'WARN'), desc = 'Next Warning' },
			{ '<leader>wk', M.diagnostic_goto(false, 'WARN'), desc = 'Prev Warning' },
			{ '<leader>ws', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = '[W]orkspace [S]ymbols' },
		}
	end

	return M._keys
end

function M.on_attach(client, buffer)
	local Keys = require('lazy.core.handler.keys')
	local keymaps = {} ---@type table<string,LazyKeys|{has?:string}>

	for _, value in ipairs(M.get()) do
		local keys = Keys.parse(value)
		if keys[2] == vim.NIL or keys[2] == false then
			keymaps[keys.id] = nil
		else
			keymaps[keys.id] = keys
		end
	end

	for _, keys in pairs(keymaps) do
		if not keys.has or client.server_capabilities[keys.has .. 'Provider'] then
			local opts = Keys.opts(keys)
			opts.has = nil
			opts.silent = true
			opts.buffer = buffer
			vim.keymap.set(keys.mode or 'n', keys[1], keys[2], opts)
		end
	end
end

function M.diagnostic_goto(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

return M
