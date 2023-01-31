return {

	'williamboman/mason.nvim',
	cmd = 'Mason',
	keys = { { '<leader>cM', '<cmd>Mason<cr>', desc = 'Mason' } },
	opts = {
		ensure_installed = {
			'eslint_d',
			'gofumpt',
			'goimports',
			'prettier',
			'staticcheck',
			'stylua',
		},
		ui = {
			border = 'rounded',
			icons = { package_installed = ' ', package_pending = ' ', package_uninstalled = ' ﮊ' },
		},
	},
	---@diagnostic disable-next-line: unused-local
	config = function(plugin, opts)
		require('mason').setup(opts)
		local mr = require('mason-registry')
		for _, tool in ipairs(opts.ensure_installed) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}
