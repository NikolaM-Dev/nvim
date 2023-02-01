local M = {}

function M.setup()
	local diagnostics = {
		severity_sort = true,
		virtual_text = { prefix = '🔥', spacing = 2 },
		float = { border = 'rounded' },
	}

	vim.diagnostic.config(diagnostics)
end

return M
