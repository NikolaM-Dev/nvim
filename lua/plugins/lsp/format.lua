local M = {}

local function is_go_tmpl(client)
	return client.name == 'html'
end

local function has_nls(buff)
	local ft = vim.bo[buff].filetype

	return #require('null-ls.sources').get_available(ft, 'NULL_LS_FORMATTING') > 0
end

local function format()
	local buf = vim.api.nvim_get_current_buf()

	vim.lsp.buf.format(vim.tbl_deep_extend('force', {
		bufnr = buf,
		filter = function(client)
			if is_go_tmpl(client) then
				return true
			end

			if has_nls(buf) then
				return client.name == 'null-ls'
			end

			return client.name ~= 'null-ls'
		end,
	}, {}))
end

function M.on_attach(client, buf)
	-- dont format if client disabled it
	if client.config.capabilities.documentFormattingProvider == false then
		return
	end

	if client.supports_method('textDocument/formatting') then
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('LspFormat.' .. buf, {}),
			buffer = buf,
			callback = function()
				format()
			end,
		})
	end
end

return M
