local function signs_setup()
	local signs = { Error = '󰅙', Hint = '󰌵', Info = '󰋼', Warn = '' }

	for name, icon in pairs(signs) do
		local hl = 'DiagnosticSign' .. name

		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

local function diagnostics_setup()
	local diagnostics = {
		float = { header = { 'Diagnostics', 'Title' }, border = 'rounded' },
		severity_sort = true,
		virtual_text = { prefix = '🔥', spacing = 2 },
	}

	vim.diagnostic.config(diagnostics)
end
