local status_ok, nvim_web_devicons = pcall(require, 'nvim-web-devicons')
if not status_ok then
	return
end

nvim_web_devicons.set_icon({
	['README.md'] = {
		color = '#42a5f5',
		icon = '',
		name = 'Readme',
	},
	['go'] = {
		color = '#00acc1',
		icon = '',
		name = 'Go',
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
	['Dockerfile'] = {
		color = '#0087c9',
		icon = '',
		name = 'Dockerfile',
	},
	['.dockerignore'] = {
		color = '#0087c9',
		icon = '',
		name = 'DockerIgnore',
	},
	['docker-compose.yml'] = {
		color = '#0087c9',
		icon = '',
		name = 'DockerCompose',
	},
	js = {
		color = '#ffca28',
		icon = '',
		name = 'Javascript',
	},
	ts = {
		color = '#0288d1',
		icon = 'ﯤ',
		name = 'Typescript',
	},
	yml = {
		color = '#FF5252',
		icon = '',
		name = 'Yaml',
	},
	toml = {
		color = '#42a5f5',
		icon = '',
		name = 'Toml',
	},
	LICENSE = {
		color = '#ff5722',
		icon = '',
		name = 'LICENSE',
	},
	json = {
		color = '#fbc02d',
		icon = 'ﬥ',
		name = 'Json',
	},
	lua = {
		color = '#42a5f5',
		icon = '',
		name = 'lua',
	},
	sh = {
		color = '#ff7043',
		cterm_color = '59',
		icon = '',
		name = 'Sh',
	},
	['.xprofile'] = {
		color = '#ff7043',
		icon = '',
		name = 'Xprofile',
	},
	['.fehbg'] = {
		color = '#ff7043',
		icon = '',
		name = 'Feh',
	},
	['.zshrc'] = {
		color = '#ff7043',
		icon = '',
		name = 'Zshrc',
	},
	conf = {
		color = '#42a5f5',
		icon = '',
		name = 'Conf',
	},
	['.gitattributes'] = {
		color = '#e64a19',
		cterm_color = '59',
		icon = '',
		name = 'GitAttributes',
	},
	['.gitconfig'] = {
		color = '#e64a19',
		cterm_color = '59',
		icon = '',
		name = 'GitConfig',
	},
	['COMMIT_EDITMSG'] = {
		color = '#e64a19',
		icon = '',
		name = 'GitEditMsg',
	},
	['.gitignore'] = {
		color = '#e64a19',
		cterm_color = '59',
		icon = '',
		name = 'GitIgnore',
	},
	['.gitlab-ci.yml'] = {
		color = '#e64a19',
		cterm_color = '166',
		icon = '',
		name = 'GitlabCI',
	},
	['.gitmodules'] = {
		color = '#e64a19',
		cterm_color = '59',
		icon = '',
		name = 'GitModules',
	},
	['.gitkeep'] = {
		color = '#e64a19',
		icon = '',
		name = 'GitKeep',
	},
	['diff'] = {
		color = '#e64a19',
		cterm_color = '59',
		icon = '',
		name = 'Diff',
	},
	vim = {
		color = '#43a047',
		icon = '',
		name = 'Vim',
	},
	['package.json'] = {
		color = '#8bc34a',
		icon = '',
		name = 'PackageJson',
	},
	['package-lock.json'] = {
		color = '#8bc34a',
		icon = '',
		name = 'PackageLock',
	},
	['yarn.lock'] = {
		color = '#0288d1',
		icon = '',
		name = 'YarnLock',
	},
	http = {
		color = '#e53935',
		icon = '爵',
		name = 'Http',
	},
	env = {
		color = '#fbc02d',
		icon = '',
		name = 'Env',
	},
	['.env'] = {
		color = '#fbc02d',
		icon = '',
		name = 'Env',
	},
	['.nvmrc'] = {
		color = '#8bc34a',
		icon = '',
		name = 'Nvmrc',
	},
	['.editorconfig'] = {
		color = '#b5c3c9',
		icon = 'ﯯ',
		name = 'EditorConfig',
	},
	md = {
		color = '#42a5f5',
		icon = '',
		name = 'Markdown',
	},
	['service.ts'] = {
		color = '#ffca28',
		icon = 'ﮰ',
		name = 'AngularService',
	},
	['controller.ts'] = {
		color = '#0288d1',
		icon = 'ﮰ',
		name = 'AngularController',
	},
	['component.ts'] = {
		color = '#0288d1',
		icon = 'ﮰ',
		name = 'AngularComponent',
	},
	['module.ts'] = {
		color = '#e53935',
		icon = 'ﮰ',
		name = 'AngularModule',
	},
	['decorator.ts'] = {
		color = '#ab47bc',
		icon = 'ﮰ',
		name = 'AngularDecorator',
	},
	['guard.ts'] = {
		color = '#43a047',
		icon = 'ﮰ',
		name = 'AngularGuard',
	},
	['pipe.ts'] = {
		color = '#00897b',
		icon = 'ﮰ',
		name = 'AngularPipe',
	},
	['filter.ts'] = {
		color = '#ff7043',
		icon = 'ﮰ',
		name = 'AngularFilter',
	},
	['interceptor.ts'] = {
		color = '#9575cd',
		icon = 'ﮰ',
		name = 'AngularInterceptor',
	},
	['directive.ts'] = {
		color = '#ab47bc',
		icon = 'ﮰ',
		name = 'AngularDirective',
	},
	['resolver.ts'] = {
		color = '#43a047',
		icon = 'ﮰ',
		name = 'AngularResolver',
	},
	['spec.ts'] = {
		color = '#0288d1',
		icon = '',
		name = 'TsSpecFile',
	},
	['spec.tsx'] = {
		color = '#00bcd4',
		icon = '',
		name = 'TsxSpecFile',
	},
	['test.ts'] = {
		color = '#0288d1',
		icon = '',
		name = 'TsTestFile',
	},
	['test.tsx'] = {
		color = '#00bcd4',
		icon = '',
		name = 'TsxTestFile',
	},
	['spec.js'] = {
		color = '#ffca28',
		icon = '',
		name = 'JsSpecFile',
	},
	['spec.jsx'] = {
		color = '#00bcd4',
		icon = '',
		name = 'JsxSpecFile',
	},
	['test.js'] = {
		color = '#ffca28',
		icon = '',
		name = 'JsTestFile',
	},
	['test.jsx'] = {
		color = '#00bcd4',
		icon = '',
		name = 'JsxTestFile',
	},
	['png'] = {
		color = '#26a69a',
		icon = '',
		name = 'Png',
	},
	['jpg'] = {
		color = '#26a69a',
		icon = '',
		name = 'Jpg',
	},
	['jpeg'] = {
		color = '#26a69a',
		icon = '',
		name = 'Jpeg',
	},
	['gif'] = {
		color = '#26a69a',
		icon = '',
		name = 'Gif',
	},
	['karma.conf.js'] = {
		color = '#26a69a',
		icon = '',
		name = 'KarmaConfg',
	},
	['favicon.ico'] = {
		color = '#ffd54f',
		icon = '',
		name = 'Favicon',
	},
	['.eslintignore'] = {
		color = '#7986cb',
		icon = '',
		name = 'EslintIgnore',
	},
	['.eslintrc'] = {
		color = '#7986cb',
		icon = '',
		name = 'Eslint',
	},
	['.eslintrc.json'] = {
		color = '#7986cb',
		icon = '',
		name = 'EslintJson',
	},

	['.eslintrc.js'] = {
		color = '#7986cb',
		icon = '',
		name = 'EslintJs',
	},
	['.prettierrc'] = {
		color = '#56b3b4',
		icon = '',
		name = 'Prettier',
	},
	['.prettierignore'] = {
		color = '#56b3b4',
		icon = '',
		name = 'PrettierIgnore',
	},
	['angular.json'] = {
		color = '#e53935',
		icon = 'ﮰ',
		name = 'Angular',
	},
	['robots.txt'] = {
		color = '#ff5252',
		icon = 'ﮧ',
		name = 'Robots',
	},
	xml = {
		color = '#8bc34a',
		icon = '',
		name = 'Xml',
	},
	['.browserslistrc'] = {
		color = '#ffca28',
		icon = '',
		name = 'BrowsersList',
	},
	['bitbucket-pipelines.yml'] = {
		color = '#1e88e5',
		icon = '',
		name = 'BitbucketPipeline',
	},
	eot = {
		color = '#f44336',
		icon = '',
		name = 'Eot',
	},
	ttf = {
		color = '#f44336',
		icon = '',
		name = 'Ttf',
	},
	otf = {
		color = '#f44336',
		icon = '',
		name = 'Otf',
	},
	woff = {
		color = '#f44336',
		icon = '',
		name = 'Woff',
	},
	woff2 = {
		color = '#f44336',
		icon = '',
		name = 'Woff2',
	},
	['en.json'] = {
		color = '#5c6bc0',
		icon = '',
		name = 'English',
	},
	['es.json'] = {
		color = '#5c6bc0',
		icon = '',
		name = 'Spanish',
	},
	ejs = {
		color = '#ffca28',
		icon = '',
		name = 'Ejs',
	},
	['entity.ts'] = {
		color = '#ffca28',
		icon = '',
		name = 'Entity',
	},
	['model.ts'] = {
		color = '#ef5350',
		icon = '',
		name = 'Model',
	},
	['interface.ts'] = {
		color = '#1976d2',
		icon = '',
		name = 'Interface',
	},
	['dto.ts'] = {
		color = '#1976d2',
		icon = '',
		name = 'Dto',
	},
	['enum.ts'] = {
		color = '#1976d2',
		icon = '',
		name = 'Enum',
	},
	['config.ts'] = {
		color = '#00acc1',
		icon = '',
		name = 'TsConfig',
	},
	scss = {
		color = '#ec407a',
		icon = '',
		name = 'Scss',
	},
	['tsconfig.app.json'] = {
		color = '#1976d2',
		icon = '',
		name = 'TsConfigApp',
	},
	['tsconfig.json'] = {
		color = '#1976d2',
		icon = '',
		name = 'TsConfig',
	},
	['tsconfig.build.json'] = {
		color = '#1976d2',
		icon = '',
		name = 'TsConfigBuild',
	},
	['tsconfig.spec.json'] = {
		color = '#1976d2',
		icon = '',
		name = 'TsConfigSpec',
	},
	svg = {
		color = '#ffb300',
		icon = 'ﰟ',
		name = 'Svg',
	},
	py = {
		color = '#3c78aa',
		icon = '',
		name = 'Python',
	},
	jsx = {
		color = '#00bcd4',
		icon = 'ﰆ',
		name = 'Jsx',
	},
	tsx = {
		color = '#00bcd4',
		icon = 'ﰆ',
		name = 'Tsx',
	},
	snippets = {
		color = '#7cb342',
		icon = '',
		name = 'Snippets',
	},
	zathurarc = {
		color = '#70b7ba',
		icon = '',
		name = 'Zathurarc',
	},
	tmux = {
		color = '#1bb91f',
		icon = '',
		name = 'Tmux',
	},
	rasi = {
		color = '#7daea3',
		icon = 'ﬓ',
		name = 'Rasi',
	},
	sql = {
		color = '#ffca28',
		icon = '',
		name = 'Sql',
	},
	astro = {
		color = '#ff6d00',
		icon = '',
		name = 'Astro',
	},
	tmpl = {
		color = '#00acc1',
		icon = '',
		name = 'Tmpl',
	},
})

nvim_web_devicons.set_default_icon('', '#42a5f5')
