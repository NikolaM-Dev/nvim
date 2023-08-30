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
			['jest.setup.js'] = {
				icon = '󱢡',
				color = '#f4511e',
				name = 'JestSetup',
			},
			['jest.config.cjs'] = {
				icon = '󱢡',
				color = '#f4511e',
				name = 'JestConfig',
			},
			['jest-e2e.json'] = {
				icon = '󱢡',
				color = '#f4511e',
				name = 'JestE2E',
			},
			['jest.config.js'] = {
				icon = '󱢡',
				color = '#f4511e',
				name = 'JestConfig',
			},
			['babel.config.cjs'] = {
				icon = '󰨥',
				color = '#fdd835',
				name = 'BabelConfig',
			},
			['babel.config.js'] = {
				icon = '󰨥',
				color = '#fdd835',
				name = 'BabelConfig',
			},
			['.babelrc'] = {
				icon = '󰨥',
				color = '#fdd835',
				cterm_color = '185',
				name = 'Babelrc',
			},
			['.nvmrc'] = {
				color = '#8bc34a',
				icon = '󰎙',
				name = 'Nvmrc',
			},
			['.prettierrc'] = {
				icon = '',
				color = '#65babb',
				name = 'Prettier',
			},
			['.prettierrc.js'] = {
				icon = '',
				color = '#65babb',
				name = 'PrettierJS',
			},
			['.prettierrc.cjs'] = {
				icon = '',
				color = '#65babb',
				name = 'PrettierConfig',
			},
			['.prettierignore'] = {
				icon = '',
				color = '#65babb',
				name = 'PrettierIgnore',
			},
			['.eslintrc'] = {
				icon = '󰱺',
				color = '#7986cb',
				cterm_color = '56',
				name = 'Eslintrc',
			},
			['.eslintrc.cjs'] = {
				icon = '󰱺',
				color = '#7986cb',
				name = 'EslintConfig',
			},
			['.eslintrc.js'] = {
				icon = '󰱺',
				color = '#7986cb',
				name = 'EslintJS',
			},
			['.eslintignore'] = {
				icon = '󰱺',
				color = '#7986cb',
				name = 'EslintIgnore',
			},
			['.editorconfig'] = {
				icon = '',
				color = '#fdfdfd',
				name = 'EditorConfig',
			},
			['contributing.md'] = {
				icon = '󰅍',
				color = '#ffca28',
				name = 'Contributing',
			},
			['.luacheckrc'] = {
				icon = '',
				color = '#42a5f5',
				name = 'LuaCheckrc',
			},
			['.envrc'] = {
				icon = '󰆍',
				color = '#ff7043',
				name = 'Envrc',
			},
			['.gitkeep'] = {
				icon = '󰊢',
				color = '#e64a19',
				name = 'GitKeep',
			},
			['cypress.config.ts'] = {
				icon = '󱍷',
				color = '#00bfa5',
				name = 'CypressConfig',
			},
			['tailwind.config.js'] = {
				icon = '󱏿',
				color = '#4db6ac',
				name = 'TailwindConfig',
			},
		})

		icons.set_default_icon('󰈙', '#42a5f5')
	end,
}
