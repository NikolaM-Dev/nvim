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
				color = '#757575',
				icon = '',
				name = 'TSConfig',
			},
			['tsconfig.node.json'] = {
				color = '#757575',
				icon = '',
				name = 'TSNodeConfig',
			},
			['tsconfig.build.json'] = {
				color = '#757575',
				icon = '',
				name = 'TSBuildConfig',
			},
			['tslint.json'] = {
				color = '#757575',
				icon = '',
				name = 'TslintConfig',
			},
			['tsconfig.spec.json'] = {
				color = '#757575',
				icon = '',
				name = 'TSSpecConfig',
			},
			['tsconfig.app.json'] = {
				color = '#757575',
				icon = '',
				name = 'TSAppConfig',
			},
			['vite.config.js'] = {
				color = '#ffab00',
				icon = '',
				name = 'ViteConfig',
			},
			['vite.config.ts'] = {
				color = '#ffab00',
				icon = '',
				name = 'ViteConfigTS',
			},
			['jest.setup.js'] = {
				color = '#f4511e',
				icon = '󱢡',
				name = 'JestSetup',
			},
			['jest.config.cjs'] = {
				color = '#f4511e',
				icon = '󱢡',
				name = 'JestConfig',
			},
			['jest-e2e.json'] = {
				color = '#f4511e',
				icon = '󱢡',
				name = 'JestE2E',
			},
			['jest.config.js'] = {
				color = '#f4511e',
				icon = '󱢡',
				name = 'JestConfig',
			},
			['babel.config.cjs'] = {
				color = '#fdd835',
				icon = '󰨥',
				name = 'BabelConfig',
			},
			['babel.config.js'] = {
				color = '#fdd835',
				icon = '󰨥',
				name = 'BabelConfig',
			},
			['.babelrc'] = {
				color = '#fdd835',
				icon = '󰨥',
				name = 'Babelrc',
			},
			['.nvmrc'] = {
				color = '#8bc34a',
				icon = '󰎙',
				name = 'Nvmrc',
			},
			['.prettierrc'] = {
				color = '#65babb',
				icon = '',
				name = 'Prettier',
			},
			['.prettierrc.js'] = {
				color = '#65babb',
				icon = '',
				name = 'PrettierJS',
			},
			['.prettierrc.cjs'] = {
				color = '#65babb',
				icon = '',
				name = 'PrettierConfig',
			},
			['.prettierignore'] = {
				color = '#65babb',
				icon = '',
				name = 'PrettierIgnore',
			},
			['.eslintrc'] = {
				color = '#7986cb',
				icon = '󰱺',
				name = 'Eslintrc',
			},
			['.eslintrc.cjs'] = {
				color = '#7986cb',
				icon = '󰱺',
				name = 'EslintConfig',
			},
			['.eslintrc.js'] = {
				color = '#7986cb',
				icon = '󰱺',
				name = 'EslintJS',
			},
			['.eslintignore'] = {
				color = '#7986cb',
				icon = '󰱺',
				name = 'EslintIgnore',
			},
			['.editorconfig'] = {
				color = '#fdfdfd',
				icon = '',
				name = 'EditorConfig',
			},
			['contributing.md'] = {
				color = '#ffca28',
				icon = '󰅍',
				name = 'Contributing',
			},
			['.luacheckrc'] = {
				color = '#42a5f5',
				icon = '',
				name = 'LuaCheckrc',
			},
			['.envrc'] = {
				color = '#ff7043',
				icon = '󰆍',
				name = 'Envrc',
			},
			['.gitkeep'] = {
				color = '#e64a19',
				icon = '󰊢',
				name = 'GitKeep',
			},
			['cypress.config.ts'] = {
				color = '#00bfa5',
				icon = '󱍷',
				name = 'CypressConfig',
			},
			['tailwind.config.js'] = {
				color = '#4db6ac',
				icon = '󱏿',
				name = 'TailwindConfig',
			},
			['postcss.config.js'] = {
				color = '#e53935',
				icon = '󱥒',
				name = 'PostcssConfig',
			},
			['settings.json'] = {
				color = '#2196f3',
				icon = '󰨞',
				name = 'VscodeSettings',
			},
		})

		icons.set_default_icon('󰈙', '#42a5f5')
	end,
}
