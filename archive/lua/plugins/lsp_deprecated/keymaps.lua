local M = {}

---@type PluginLspKeys
M._keys = nil

local function diagnostic_goto(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil

	return function()
		go({ severity = severity })
		vim.diagnostic.open_float()
	end
end

---@return (LazyKeys|{has?:string})[]
function M.get()
	if not M._keys then
		---@class PluginLspKeys
		M._keys = {
			{ '<C-k>', vim.lsp.buf.signature_help, mode = 'i', desc = 'Signature Documentation' },
			{ 'ga', vim.lsp.buf.code_action, desc = '[C]ode [A]ction' },
			{ 'gd', '<cmd>Telescope lsp_definitions<cr>', desc = '[G]o to [D]efinition' },
			{ 'gD', vim.lsp.buf.declaration, desc = '[G]oto [D]eclaration' },
			{ 'gI', '<cmd>Telescope lsp_implementations<cr>', desc = '[G]oto [I]mplementation' },
			{ 'gr', vim.lsp.buf.rename, desc = '[R]e[n]ame' },
			{ 'K', vim.lsp.buf.hover, desc = 'Hover Documentation' },
			{ '<leader>D', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'Type [D]efinitions' },
			{ '<leader>dj', diagnostic_goto(true), desc = 'Next [D]iagnostic' },
			{ '<leader>dk', diagnostic_goto(false), desc = 'Prev [D]iagnostic' },
			{ '<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', desc = '[D]ocument [S]ymbols' },
			{ '<leader>Ej', diagnostic_goto(true, 'ERROR'), desc = 'Next Error' },
			{ '<leader>Ek', diagnostic_goto(false, 'ERROR'), desc = 'Prev Error' },
			{ '<leader>K', vim.lsp.buf.hover, desc = 'Hover' },
			{ '<leader>ld', vim.diagnostic.open_float, desc = '[L]ine [D]iagnostics' },
			{ '<leader>li', '<cmd>LspInfo<cr>', desc = 'Lsp Info' },
			{ '<Leader>ll', '<cmd>LspLog<cr>', desc = 'Lsp Log' },
			{ '<Leader>lr', '<cmd>LspRestart<cr>', desc = 'Lsp Restart' },
			{ '<leader>sd', '<cmd>FzfLua diagnostics_workspace<cr>', desc = '[S]earch [D]iagnostics' },
			{ '<leader>wj', diagnostic_goto(true, 'WARN'), desc = 'Next Warning' },
			{ '<leader>wk', diagnostic_goto(false, 'WARN'), desc = 'Prev Warning' },
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
			opts.silent = opts.silent ~= false
			opts.buffer = buffer

			vim.keymap.set(keys.mode or 'n', keys[1], keys[2], opts)
		end
	end
end

return M
