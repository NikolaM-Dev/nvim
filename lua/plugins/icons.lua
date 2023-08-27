return {
	'nvim-tree/nvim-web-devicons',
	config = function()
		local icons = require('nvim-web-devicons')

		icons.setup({
			['yarn.lock'] = {
				color = '#0288d1',
				icon = '',
				name = 'YarnLock',
			},
			['tsconfig.json'] = {
				icon = '',
				color = '#757575',
				name = 'TSConfig',
			},
			['tsconfig.node.json'] = {
				icon = '',
				color = '#757575',
				name = 'TSNodeConfig',
			},
			['tsconfig.build.json'] = {
				icon = '',
				color = '#757575',
				name = 'TSBuildConfig',
			},
			['tslint.json'] = {
				icon = '',
				color = '#757575',
				name = 'TslintConfig',
			},
			['tsconfig.spec.json'] = {
				icon = '',
				color = '#757575',
				name = 'TSSpecConfig',
			},
			['tsconfig.app.json'] = {
				icon = '',
				color = '#757575',
				name = 'TSAppConfig',
			},
			['vite.config.js'] = {
				icon = '',
				color = '#ffab00',
				name = 'ViteConfig',
			},
			['vite.config.ts'] = {
				icon = '',
				color = '#ffab00',
				name = 'ViteConfigTS',
			},
		})

		icons.set_default_icon('󰈙', '#42a5f5')
	end,
}
