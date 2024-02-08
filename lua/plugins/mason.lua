return {
	'williamboman/mason.nvim',
	cmd = 'Mason',
	keys = {
		{ '<leader>cm', '<cmd>Mason<cr>', desc = '[M]ason' },
	},
	config = function()
		local sources = {
			'css-lsp',
			'eslint_d',
			'eslint-lsp',
			'gofumpt',
			'goimports',
			'gopls',
			'html-lsp',
			'json-lsp',
			'lua-language-server',
			'marksman',
			'prettier',
			'prettierd',
			'staticcheck',
			'stylua',
			'svelte-language-server',
			'tailwindcss-language-server',
			'taplo',
			'typescript-language-server',
			'vim-language-server',
		}

		require('mason').setup({
			ensure_installed = sources,
			ui = {
				border = 'rounded',
				icons = { package_installed = '󰄳 ', package_pending = ' ', package_uninstalled = '󰚌 ' },
			},
		})

		local mr = require('mason-registry')
		local function ensure_installed()
			for _, s in ipairs(sources) do
				local p = mr.get_package(s)

				if not p:is_installed() then
					p:install()
				end
			end
		end

		if mr.refresh then
			mr.refresh(ensure_installed)
		else
			ensure_installed()
		end
	end,
}
