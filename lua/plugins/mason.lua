return {

	'williamboman/mason.nvim',
	cmd = 'Mason',
	keys = { { '<leader>cM', '<cmd>Mason<cr>', desc = 'Mason' } },
	config = function()
		local sources = {
			'eslint_d',
			'gofumpt',
			'goimports',
			'prettier',
			'staticcheck',
			'stylua',
		}

		require('mason').setup({
			ensure_installed = sources,
			ui = {
				border = 'rounded',
				icons = { package_installed = ' ', package_pending = ' ', package_uninstalled = ' ﮊ' },
			},
		})

		local mr = require('mason-registry')
		for _, s in ipairs(sources) do
			local p = mr.get_package(s)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}
