return {
	'nvim-tree/nvim-web-devicons',
	config = function()
		local icons = require('nvim-web-devicons')

		icons.setup({
			override = {

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
				['commit_editmsg'] = {
					icon = '󰷈',
					color = '#e64a19',
					name = 'GitCommit',
				},
				['.gitkeep'] = {
					color = '#e64a19',
					icon = '󰊢',
					name = 'GitKeep',
				},
				['.gitattributes'] = {
					color = '#e64a19',
					icon = '󰊢',
					name = 'GitAttributes',
				},
				['.gitconfig'] = {
					color = '#e64a19',
					icon = '',
					name = 'GitConfig',
				},
				['.gitignore'] = {
					color = '#e64a19',
					icon = '󰊢',
					name = 'GitIgnore',
				},
				['.gitmodules'] = {
					color = '#e64a19',
					icon = '󰏗',
					name = 'GitModules',
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
				['ormconfig.js'] = {
					color = '#ffca28',
					icon = '󱙋',
					name = 'OrmConfig',
				},
				['ormconfig.ts'] = {
					color = '#0288d1',
					icon = '󱙋',
					name = 'OrmConfigTS',
				},
				['nest-cli.json'] = {
					color = '#e53935',
					icon = '',
					name = 'NestCli',
				},
				['karma.conf.js'] = {
					color = '#26a69a',
					icon = '',
					name = 'KarmaConf',
				},
				['robots.txt'] = {
					color = '#ff5252',
					icon = '󱚝',
					name = 'Robots',
				},
				['.browserslistrc'] = {
					color = '#ffca28',
					icon = '',
					name = 'Browerslist',
				},
				['bitbucket-pipelines.yml'] = {
					color = '#1e88e5',
					icon = '󰂨',
					name = 'BitbucketPipeline',
				},
				['angular.json'] = {
					color = '#e53935',
					icon = '󰚲',
					name = 'Angular',
				},
				['app.e2e-spec.ts'] = {
					color = '#0288d1',
					icon = '',
					name = 'AppE2E',
				},
				['pnpm-lock.yaml'] = {
					color = '#ffb300',
					icon = '󰕰',
					name = 'PnpmLock',
				},
				['readme.md'] = {
					color = '#42a5f5',
					icon = '󰀨',
					name = 'Readme',
				},
				['go.mod'] = {
					color = '#ec407a',
					icon = '',
					name = 'GoMod',
				},
				['go.sum'] = {
					color = '#ec407a',
					icon = '',
					name = 'GoSum',
				},
				['.fehbg'] = {
					color = '#ff7043',
					icon = '󰸉',
					name = 'Fehbg',
				},
				['.npmignore'] = {
					color = '#e53935',
					icon = '󰝆',
					name = 'NPMIgnore',
				},
				['.npmrc'] = {
					color = '#e53935',
					icon = '󰝆',
					name = 'NPMrc',
				},
				['.zshenv'] = {
					color = '#ff7043',
					icon = '󰆍',
					name = 'Zshenv',
				},
				['.zshrc'] = {
					color = '#ff7043',
					icon = '󰆍',
					name = 'Zshrc',
				},
				['.zprofile'] = {
					color = '#ff7043',
					icon = '󰆍',
					name = 'Zshprofile',
				},
				['copying'] = {
					color = '#ff5722',
					icon = '󰄤',
					name = 'License',
				},
				['copying.lesser'] = {
					color = '#ff5722',
					icon = '󰄤',
					name = 'License',
				},
				['license'] = {
					color = '#ff5722',
					icon = '󰄤',
					name = 'License',
				},
				['unlicense'] = {
					color = '#ff5722',
					icon = '󰄤',
					name = 'License',
				},
				['license.md'] = {
					color = '#ff5722',
					icon = '󰄤',
					name = 'License',
				},
				['docker-compose.yml'] = {
					color = '#0087c9',
					icon = '󰡨',
					name = 'DockerCompose',
				},
				['docker-compose.yaml'] = {
					color = '#0087c9',
					icon = '󰡨',
					name = 'DockerCompose',
				},
				['.dockerignore'] = {
					color = '#0087c9',
					icon = '󰡨',
					name = 'DockerIgnore',
				},
				['dockerfile'] = {
					color = '#0087c9',
					icon = '󰡨',
					name = 'Dockerfile',
				},
				['package.json'] = {
					color = '#8bc34a',
					icon = '󰎙',
					name = 'PackageJson',
				},
				['package-lock.json'] = {
					color = '#8bc34a',
					icon = '󰈡',
					name = 'PackageLockJson',
				},
				['favicon.ico'] = {
					color = '#ffd54f',
					icon = '',
					name = 'Favicon',
				},
				['gnumakefile'] = {
					color = '#ef5350',
					icon = '󱕷',
					name = 'Makefile',
				},
				['makefile'] = {
					color = '#ef5350',
					icon = '󱕷',
					name = 'Makefile',
				},
				['.env'] = {
					color = '#fbc02d',
					icon = '',
					name = 'Env',
				},
				['en.json'] = {
					color = '#5c6bc0',
					icon = '󰊿',
					name = 'English',
				},
				['es.json'] = {
					color = '#5c6bc0',
					icon = '󰊿',
					name = 'Spanish',
				},
				['service.ts'] = {
					icon = '',
					color = '#ffca28',
					name = 'Service',
				},
				['controller.ts'] = {
					color = '#0288d1',
					icon = '',
					name = 'Controller',
				},
				['module.ts'] = {
					color = '#e53935',
					icon = '',
					name = 'Module',
				},
				['decorator.ts'] = {
					color = '#ab47bc',
					icon = '',
					name = 'Decorator',
				},
				['guard.ts'] = {
					color = '#43a047',
					icon = '',
					name = 'Guard',
				},
				['pipe.ts'] = {
					color = '#00897b',
					icon = '',
					name = 'Pipe',
				},
				['filter.ts'] = {
					color = '#ff7043',
					icon = '',
					name = 'Filter',
				},
				['directive.ts'] = {
					color = '#ab47bc',
					icon = '󰚲',
					name = 'Directive',
				},
				['resolve.ts'] = {
					color = '#43a047',
					icon = '󰚲',
					name = 'Resolver',
				},
				['model.ts'] = {
					color = '#ef5350',
					icon = '',
					name = 'Model',
				},
				['interceptor.ts'] = {
					color = '#9575cd',
					icon = '',
					name = 'Interceptor',
				},
				['woff'] = {
					color = '#f44336',
					icon = '',
					name = 'Woff',
				},
				['woff2'] = {
					color = '#f44336',
					icon = '',
					name = 'Woff2',
				},
				['ttf'] = {
					icon = '',
					color = '#f44336',
					name = 'Ttf',
				},
				['snap'] = {
					color = '#00bcd4',
					icon = '󰷊',
					name = 'Snap',
				},
			},
		})

		icons.set_default_icon('󰈙', '#42a5f5')
	end,
}
