local M = {}

---@type PluginLspKeys
M._keys = nil

---@return (LazyKeys|{has?:string})[]
function M.get()
	if not M._keys then
		---@class PluginLspKeys
		M._keys = {
			{ '<A-k>', vim.lsp.buf.signature_help, mode = 'i', desc = 'Signature Help', has = 'signatureHelp' },
			{ 'gd', '<cmd>Telescope lsp_definitions<cr>', desc = 'Goto Definition' },
			{ 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
			{ 'gI', '<cmd>Telescope lsp_implementations<cr>', desc = 'Goto Implementation' },
			{ 'gK', vim.lsp.buf.signature_help, desc = 'Signature Help', has = 'signatureHelp' },
			{ 'gt', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'Goto Type Definition' },
			{ '<leader>Ej', M.diagnostic_goto(true, 'ERROR'), desc = 'Next Error' },
			{ '<leader>Ek', M.diagnostic_goto(false, 'ERROR'), desc = 'Prev Error' },
			{ '<leader>K', vim.lsp.buf.hover, desc = 'Hover' },
			{ '<leader>li', '<cmd>LspInfo<cr>', desc = 'Lsp Info' },
			{ '<Leader>ll', '<cmd>LspLog<cr>', desc = 'Lsp Log' },
			{ '<Leader>lr', '<cmd>LspRestart<cr>', desc = 'Lsp Restart' },
			{ '<leader>wj', M.diagnostic_goto(true, 'WARN'), desc = 'Next Warning' },
			{ '<leader>wk', M.diagnostic_goto(false, 'WARN'), desc = 'Prev Warning' },
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
