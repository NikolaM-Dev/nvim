local M = {}

local function has_disable_capabilities(client)
	return client.config
		and client.config.capabilities
		and client.config.capabilities.documentFormattingProvider == false
end

-- Gets all lsp clients that support formatting
-- and have not disabled it in their client config
---@param client lsp.Client
local function supports_format(client)
	if has_disable_capabilities(client) then
		return false
	end

	return client.supports_method('textDocument/formatting') or client.supports_method('textDocument/rangeFormatting')
end

-- Gets all lsp clients that support formatting.
-- When a null-ls formatter is available for the current filetype,
-- only null-ls formatters are returned.
local function get_formatters(bufnr)
	local ft = vim.bo[bufnr].filetype
	-- check if we have any null-ls formatters for the current filetype
	local null_ls = package.loaded['null-ls'] and require('null-ls.sources').get_available(ft, 'NULL_LS_FORMATTING')
		or {}

	---@class LazyVimFormatters
	local ret = {
		---@type lsp.Client[]
		active = {},
		---@type lsp.Client[]
		available = {},
		null_ls = null_ls,
	}

	---@type lsp.Client[]
	local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
	for _, client in ipairs(clients) do
		if supports_format(client) then
			if (#null_ls > 0 and client.name == 'null-ls') or #null_ls == 0 then
				table.insert(ret.active, client)
			else
				table.insert(ret.available, client)
			end
		end
	end

	return ret
end

local function format()
	local buf = vim.api.nvim_get_current_buf()

	local formatters = get_formatters(buf)
	local client_ids = vim.tbl_map(function(client)
		return client.id
	end, formatters.active)

	if #client_ids == 0 then
		return
	end

	vim.lsp.buf.format(vim.tbl_deep_extend('force', {
		bufnr = buf,
		filter = function(client)
			return vim.tbl_contains(client_ids, client.id)
		end,
	}, {}))
end

function M.setup()
	vim.api.nvim_create_autocmd('BufWritePre', {
		group = vim.api.nvim_create_augroup('LspFormat', {}),
		callback = function()
			format()
		end,
	})
end

return M
