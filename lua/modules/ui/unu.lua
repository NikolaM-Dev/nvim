-- references:
-- 1. Linguist: https://github.com/github/linguist
-- 2. coc-explorer: https://github.com/weirongxu/coc-explorer/blob/59bd41f8fffdc871fbd77ac443548426bd31d2c3/src/icons.nerdfont.json#L2
-- 3. chad-tree: https://github.com/ms-jpq/chadtree/blob/f9f333c062/artifacts/icons.json
-- jquery = {
--   icon = "",
--   color = "#1B75BB"
-- },
-- angular = {
--   icon = "",
--   color = "#E23237"
-- },
-- backbone = {
--   icon = "",
--   color = "#0071B5"
-- },
-- requirejs = {
--   icon = "",
--   color = "#F44A41"
-- },
-- materialize = {
--   icon = "",
--   color = "#EE6E73"
-- },
-- mootools = {
--   icon = "",
--   color = "#ECECEC"
-- },
-- puppet = {
--   icon = "",
--   color = "#ffa61a"
-- },

-- When adding new icons, remember to add an entry to the `filetypes` table, if applicable.
local icons = {
	['.babelrc'] = {
		icon = 'ﬥ',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'Babelrc',
	},
	['.bash_profile'] = {
		icon = '',
		color = '#89e051',
		cterm_color = '113',
		name = 'BashProfile',
	},
	['.bashrc'] = {
		icon = '',
		color = '#89e051',
		cterm_color = '113',
		name = 'Bashrc',
	},
	['.ds_store'] = {
		icon = '',
		color = '#41535b',
		cterm_color = '59',
		name = 'DsStore',
	},
	['.gitattributes'] = {
		icon = '',
		color = '#41535b',
		cterm_color = '59',
		name = 'GitAttributes',
	},
	['.gitconfig'] = {
		icon = '',
		color = '#41535b',
		cterm_color = '59',
		name = 'GitConfig',
	},
	['.gitignore'] = {
		icon = '',
		color = '#41535b',
		cterm_color = '59',
		name = 'GitIgnore',
	},
	['.gitlab-ci.yml'] = {
		icon = '',
		color = '#e24329',
		cterm_color = '166',
		name = 'GitlabCI',
	},
	['.gitmodules'] = {
		icon = '',
		color = '#41535b',
		cterm_color = '59',
		name = 'GitModules',
	},
	['.gvimrc'] = {
		icon = '',
		color = '#019833',
		cterm_color = '29',
		name = 'Gvimrc',
	},
	['.npmignore'] = {
		icon = '',
		color = '#E8274B',
		cterm_color = '161',
		name = 'NPMIgnore',
	},
	['.npmrc'] = {
		icon = '',
		color = '#E8274B',
		cterm_color = '161',
		name = 'NPMrc',
	},
	['.settings.json'] = {
		icon = '',
		color = '#854CC7',
		cterm_color = '98',
		name = 'SettingsJson',
	},
	['.vimrc'] = {
		icon = '',
		color = '#019833',
		cterm_color = '29',
		name = 'Vimrc',
	},
	['.zprofile'] = {
		icon = '',
		color = '#89e051',
		cterm_color = '113',
		name = 'Zshprofile',
	},
	['.zshenv'] = {
		icon = '',
		color = '#89e051',
		cterm_color = '113',
		name = 'Zshenv',
	},
	['.zshrc'] = {
		icon = '',
		color = '#89e051',
		cterm_color = '113',
		name = 'Zshrc',
	},
	['Brewfile'] = {
		icon = '',
		color = '#701516',
		cterm_color = '52',
		name = 'Brewfile',
	},
	['CMakeLists.txt'] = {
		icon = '',
		color = '#6d8086',
		cterm_color = '66',
		name = 'CMakeLists',
	},
	['COMMIT_EDITMSG'] = {
		icon = '',
		color = '#41535b',
		cterm_color = '59',
		name = 'GitCommit',
	},
	['COPYING'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'License',
	},
	['COPYING.LESSER'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'License',
	},
	['Dockerfile'] = {
		icon = '',
		color = '#384d54',
		cterm_color = '59',
		name = 'Dockerfile',
	},
	['Gemfile$'] = {
		icon = '',
		color = '#701516',
		cterm_color = '52',
		name = 'Gemfile',
	},
	['LICENSE'] = {
		icon = '',
		color = '#d0bf41',
		cterm_color = '179',
		name = 'License',
	},
	['R'] = {
		icon = 'ﳒ',
		color = '#358a5b',
		cterm_color = '65',
		name = 'R',
	},
	['Rmd'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Rmd',
	},
	['Vagrantfile$'] = {
		icon = '',
		color = '#1563FF',
		cterm_color = '27',
		name = 'Vagrantfile',
	},
	['_gvimrc'] = {
		icon = '',
		color = '#019833',
		cterm_color = '29',
		name = 'Gvimrc',
	},
	['_vimrc'] = {
		icon = '',
		color = '#019833',
		cterm_color = '29',
		name = 'Vimrc',
	},
	['ai'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'Ai',
	},
	['awk'] = {
		icon = '',
		color = '#4d5a5e',
		cterm_color = '59',
		name = 'Awk',
	},
	['bash'] = {
		icon = '',
		color = '#89e051',
		cterm_color = '113',
		name = 'Bash',
	},
	['bat'] = {
		icon = '',
		color = '#C1F12E',
		cterm_color = '154',
		name = 'Bat',
	},
	['bmp'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Bmp',
	},
	['c'] = {
		icon = '',
		color = '#599eff',
		cterm_color = '75',
		name = 'C',
	},
	['c++'] = {
		icon = '',
		color = '#f34b7d',
		cterm_color = '204',
		name = 'CPlusPlus',
	},
	['cbl'] = {
		icon = '⚙',
		color = '#005ca5',
		cterm_color = '25',
		name = 'Cobol',
	},
	['cc'] = {
		icon = '',
		color = '#f34b7d',
		cterm_color = '204',
		name = 'CPlusPlus',
	},
	['cfg'] = {
		icon = '',
		color = '#ECECEC',
		cterm_color = '231',
		name = 'Configuration',
	},
	['clj'] = {
		icon = '',
		color = '#8dc149',
		cterm_color = '107',
		name = 'Clojure',
	},
	['cljc'] = {
		icon = '',
		color = '#8dc149',
		cterm_color = '107',
		name = 'ClojureC',
	},
	['cljs'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'ClojureJS',
	},
	['cljd'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'ClojureDart',
	},
	['cmake'] = {
		icon = '',
		color = '#6d8086',
		cterm_color = '66',
		name = 'CMake',
	},
	['cob'] = {
		icon = '⚙',
		color = '#005ca5',
		cterm_color = '25',
		name = 'Cobol',
	},
	['cobol'] = {
		icon = '⚙',
		color = '#005ca5',
		cterm_color = '25',
		name = 'Cobol',
	},
	['coffee'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'Coffee',
	},
	['conf'] = {
		icon = '',
		color = '#6d8086',
		cterm_color = '66',
		name = 'Conf',
	},
	['config.ru'] = {
		icon = '',
		color = '#701516',
		cterm_color = '52',
		name = 'ConfigRu',
	},
	['cp'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Cp',
	},
	['cpp'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Cpp',
	},
	['cpy'] = {
		icon = '⚙',
		color = '#005ca5',
		cterm_color = '25',
		name = 'Cobol',
	},
	['cr'] = {
		icon = '',
		color = '#000000',
		cterm_color = '16',
		name = 'Crystal',
	},
	['cs'] = {
		icon = '',
		color = '#596706',
		cterm_color = '58',
		name = 'Cs',
	},
	['csh'] = {
		icon = '',
		color = '#4d5a5e',
		cterm_color = '59',
		name = 'Csh',
	},
	['cson'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'Cson',
	},
	['css'] = {
		icon = '',
		color = '#563d7c',
		cterm_color = '60',
		name = 'Css',
	},
	['csv'] = {
		icon = '',
		color = '#89e051',
		cterm_color = '113',
		name = 'Csv',
	},
	['cxx'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Cxx',
	},
	['d'] = {
		icon = '',
		color = '#427819',
		cterm_color = '64',
		name = 'D',
	},
	['dart'] = {
		icon = '',
		color = '#03589C',
		cterm_color = '25',
		name = 'Dart',
	},
	['db'] = {
		icon = '',
		color = '#dad8d8',
		cterm_color = '188',
		name = 'Db',
	},
	['desktop'] = {
		icon = '',
		color = '#563d7c',
		cterm_color = '60',
		name = 'DesktopEntry',
	},
	['diff'] = {
		icon = '',
		color = '#41535b',
		cterm_color = '59',
		name = 'Diff',
	},
	['doc'] = {
		icon = '',
		color = '#185abd',
		cterm_color = '25',
		name = 'Doc',
	},
	['dockerfile'] = {
		icon = '',
		color = '#384d54',
		cterm_color = '59',
		name = 'Dockerfile',
	},
	['drl'] = {
		icon = '',
		color = '#ffafaf',
		cterm_color = '217',
		name = 'Drools',
	},
	['dropbox'] = {
		icon = '',
		color = '#0061FE',
		cterm_color = '27',
		name = 'Dropbox',
	},
	['dump'] = {
		icon = '',
		color = '#dad8d8',
		cterm_color = '188',
		name = 'Dump',
	},
	['edn'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Edn',
	},
	['eex'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Eex',
	},
	['ejs'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'Ejs',
	},
	['elm'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Elm',
	},
	['epp'] = {
		icon = '',
		color = '#FFA61A',
		name = 'Epp',
	},
	['erb'] = {
		icon = '',
		color = '#701516',
		cterm_color = '52',
		name = 'Erb',
	},
	['erl'] = {
		icon = '',
		color = '#B83998',
		cterm_color = '132',
		name = 'Erl',
	},
	['ex'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Ex',
	},
	['exs'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Exs',
	},
	['f#'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Fsharp',
	},
	['favicon.ico'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'Favicon',
	},
	['fnl'] = {
		color = '#fff3d7',
		icon = '🌜',
		cterm_color = '230',
		name = 'Fennel',
	},
	['fish'] = {
		icon = '',
		color = '#4d5a5e',
		cterm_color = '59',
		name = 'Fish',
	},
	['fs'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Fs',
	},
	['fsi'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Fsi',
	},
	['fsscript'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Fsscript',
	},
	['fsx'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Fsx',
	},
	['gd'] = {
		icon = '',
		color = '#6d8086',
		cterm_color = '66',
		name = 'GDScript',
	},
	['gemspec'] = {
		icon = '',
		color = '#701516',
		cterm_color = '52',
		name = 'Gemspec',
	},
	['gif'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Gif',
	},
	['git'] = {
		icon = '',
		color = '#F14C28',
		cterm_color = '202',
		name = 'GitLogo',
	},
	['glb'] = {
		icon = '',
		color = '#FFB13B',
		cterm_color = '215',
		name = 'BinaryGLTF',
	},
	['go'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Go',
	},
	['godot'] = {
		icon = '',
		color = '#6d8086',
		cterm_color = '66',
		name = 'GodotProject',
	},
	['gruntfile'] = {
		icon = '',
		color = '#e37933',
		cterm_color = '173',
		name = 'Gruntfile',
	},
	['gulpfile'] = {
		icon = '',
		color = '#cc3e44',
		cterm_color = '167',
		name = 'Gulpfile',
	},
	['h'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'H',
	},
	['haml'] = {
		icon = '',
		color = '#eaeae1',
		cterm_color = '188',
		name = 'Haml',
	},
	['hbs'] = {
		icon = '',
		color = '#f0772b',
		cterm_color = '208',
		name = 'Hbs',
	},
	['heex'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Heex',
	},
	['hh'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Hh',
	},
	['hpp'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Hpp',
	},
	['hrl'] = {
		icon = '',
		color = '#B83998',
		cterm_color = '132',
		name = 'Hrl',
	},
	['hs'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Hs',
	},
	['htm'] = {
		icon = '',
		color = '#e34c26',
		cterm_color = '166',
		name = 'Htm',
	},
	['html'] = {
		icon = '',
		color = '#e34c26',
		cterm_color = '166',
		name = 'Html',
	},
	['hxx'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Hxx',
	},
	['ico'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'Ico',
	},
	['import'] = {
		icon = '',
		color = '#ECECEC',
		cterm_color = '231',
		name = 'ImportConfiguration',
	},
	['ini'] = {
		icon = '',
		color = '#6d8086',
		cterm_color = '66',
		name = 'Ini',
	},
	['java'] = {
		icon = '',
		color = '#cc3e44',
		cterm_color = '167',
		name = 'Java',
	},
	['jl'] = {
		icon = '',
		color = '#a270ba',
		cterm_color = '133',
		name = 'Jl',
	},
	['jpeg'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Jpeg',
	},
	['jpg'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Jpg',
	},
	['js'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'Js',
	},
	['json'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'Json',
	},
	['jsx'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Jsx',
	},
	['ksh'] = {
		icon = '',
		color = '#4d5a5e',
		cterm_color = '59',
		name = 'Ksh',
	},
	['kt'] = {
		icon = '𝙆',
		color = '#F88A02',
		cterm_color = '208',
		name = 'Kotlin',
	},
	['kts'] = {
		icon = '𝙆',
		color = '#F88A02',
		cterm_color = '208',
		name = 'KotlinScript',
	},
	['leex'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Leex',
	},
	['less'] = {
		icon = '',
		color = '#563d7c',
		cterm_color = '60',
		name = 'Less',
	},
	['lhs'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Lhs',
	},
	['license'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'License',
	},
	['lua'] = {
		icon = '',
		color = '#51a0cf',
		cterm_color = '74',
		name = 'Lua',
	},
	['makefile'] = {
		icon = '',
		color = '#6d8086',
		cterm_color = '66',
		name = 'Makefile',
	},
	['markdown'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Markdown',
	},
	['material'] = {
		icon = '',
		color = '#B83998',
		cterm_color = '132',
		name = 'Material',
	},
	['md'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Md',
	},
	['mdx'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Mdx',
	},
	['mint'] = {
		icon = '',
		color = '#87c095',
		cterm_color = '108',
		name = 'Mint',
	},
	['mix.lock'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'MixLock',
	},
	['mjs'] = {
		icon = '',
		color = '#f1e05a',
		cterm_color = '221',
		name = 'Mjs',
	},
	['ml'] = {
		icon = 'λ',
		color = '#e37933',
		cterm_color = '173',
		name = 'Ml',
	},
	['mli'] = {
		icon = 'λ',
		color = '#e37933',
		cterm_color = '173',
		name = 'Mli',
	},
	['mo'] = {
		icon = '∞',
		color = '#9772FB',
		cterm_color = '99',
		name = 'Motoko',
	},
	['mustache'] = {
		icon = '',
		color = '#e37933',
		cterm_color = '173',
		name = 'Mustache',
	},
	['nim'] = {
		icon = '👑',
		color = '#f3d400',
		cterm_color = '220',
		name = 'Nim',
	},
	['nix'] = {
		icon = '',
		color = '#7ebae4',
		cterm_color = '110',
		name = 'Nix',
	},
	['node_modules'] = {
		icon = '',
		color = '#E8274B',
		cterm_color = '161',
		name = 'NodeModules',
	},
	['opus'] = {
		icon = '',
		color = '#F88A02',
		cterm_color = '208',
		name = 'OPUS',
	},
	['otf'] = {
		icon = '',
		color = '#ECECEC',
		cterm_color = '231',
		name = 'OpenTypeFont',
	},
	['package.json'] = {
		icon = '',
		color = '#e8274b',
		name = 'PackageJson',
	},
	['package-lock.json'] = {
		icon = '',
		color = '#7a0d21',
		name = 'PackageLockJson',
	},
	['pck'] = {
		icon = '',
		color = '#6d8086',
		cterm_color = '66',
		name = 'PackedResource',
	},
	['pdf'] = {
		icon = '',
		color = '#b30b00',
		cterm_color = '124',
		name = 'Pdf',
	},
	['php'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Php',
	},
	['pl'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Pl',
	},
	['pm'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Pm',
	},
	['png'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Png',
	},
	['pp'] = {
		icon = '',
		color = '#FFA61A',
		name = 'Pp',
	},
	['ppt'] = {
		icon = '',
		color = '#cb4a32',
		cterm_color = '167',
		name = 'Ppt',
	},
	['pro'] = {
		icon = '',
		color = '#e4b854',
		cterm_color = '179',
		name = 'Prolog',
	},
	['procfile'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Procfile',
	},
	['ps1'] = {
		icon = '',
		color = '#4d5a5e',
		cterm_color = '59',
		name = 'PromptPs1',
	},
	['psb'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Psb',
	},
	['psd'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Psd',
	},
	['py'] = {
		icon = '',
		color = '#ffbc03',
		cterm_color = '61',
		name = 'Py',
	},
	['pyc'] = {
		icon = '',
		color = '#ffe291',
		cterm_color = '67',
		name = 'Pyc',
	},
	['pyd'] = {
		icon = '',
		color = '#ffe291',
		cterm_color = '67',
		name = 'Pyd',
	},
	['pyo'] = {
		icon = '',
		color = '#ffe291',
		cterm_color = '67',
		name = 'Pyo',
	},
	['r'] = {
		icon = 'ﳒ',
		color = '#358a5b',
		cterm_color = '65',
		name = 'R',
	},
	['rake'] = {
		icon = '',
		color = '#701516',
		cterm_color = '52',
		name = 'Rake',
	},
	['rakefile'] = {
		icon = '',
		color = '#701516',
		cterm_color = '52',
		name = 'Rakefile',
	},
	['rb'] = {
		icon = '',
		color = '#701516',
		cterm_color = '52',
		name = 'Rb',
	},
	['rlib'] = {
		icon = '',
		color = '#dea584',
		cterm_color = '180',
		name = 'Rlib',
	},
	['rmd'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Rmd',
	},
	['rproj'] = {
		icon = '鉶',
		color = '#358a5b',
		cterm_color = '65',
		name = 'Rproj',
	},
	['rs'] = {
		icon = '',
		color = '#dea584',
		cterm_color = '180',
		name = 'Rs',
	},
	['rss'] = {
		icon = '',
		color = '#FB9D3B',
		cterm_color = '215',
		name = 'Rss',
	},
	['sass'] = {
		icon = '',
		color = '#f55385',
		cterm_color = '204',
		name = 'Sass',
	},
	['scala'] = {
		icon = '',
		color = '#cc3e44',
		cterm_color = '167',
		name = 'Scala',
	},
	['scss'] = {
		icon = '',
		color = '#f55385',
		cterm_color = '204',
		name = 'Scss',
	},
	['sh'] = {
		icon = '',
		color = '#4d5a5e',
		cterm_color = '59',
		name = 'Sh',
	},
	['sig'] = {
		icon = 'λ',
		color = '#e37933',
		cterm_color = '173',
		name = 'Sig',
	},
	['slim'] = {
		icon = '',
		color = '#e34c26',
		cterm_color = '166',
		name = 'Slim',
	},
	['sln'] = {
		icon = '',
		color = '#854CC7',
		cterm_color = '98',
		name = 'Sln',
	},
	['sml'] = {
		icon = 'λ',
		color = '#e37933',
		cterm_color = '173',
		name = 'Sml',
	},
	['sql'] = {
		icon = '',
		color = '#dad8d8',
		cterm_color = '188',
		name = 'Sql',
	},
	['sqlite'] = {
		icon = '',
		color = '#dad8d8',
		cterm_color = '188',
		name = 'Sql',
	},
	['sqlite3'] = {
		icon = '',
		color = '#dad8d8',
		cterm_color = '188',
		name = 'Sql',
	},
	['styl'] = {
		icon = '',
		color = '#8dc149',
		cterm_color = '107',
		name = 'Styl',
	},
	['sublime'] = {
		icon = '',
		color = '#e37933',
		cterm_color = '98',
		name = 'Suo',
	},
	['suo'] = {
		icon = '',
		color = '#854CC7',
		cterm_color = '98',
		name = 'Suo',
	},
	['sv'] = {
		icon = '',
		color = '#019833',
		cterm_color = '29',
		name = 'SystemVerilog',
	},
	['svelte'] = {
		icon = '',
		color = '#ff3e00',
		cterm_color = '202',
		name = 'Svelte',
	},
	['svh'] = {
		icon = '',
		color = '#019833',
		cterm_color = '29',
		name = 'SystemVerilog',
	},
	['svg'] = {
		icon = 'ﰟ',
		color = '#FFB13B',
		cterm_color = '215',
		name = 'Svg',
	},
	['swift'] = {
		icon = '',
		color = '#e37933',
		cterm_color = '173',
		name = 'Swift',
	},
	['t'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Tor',
	},
	['tbc'] = {
		icon = '﯑',
		color = '#1e5cb3',
		cterm_color = '67',
		name = 'Tcl',
	},
	['tcl'] = {
		icon = '﯑',
		color = '#1e5cb3',
		cterm_color = '67',
		name = 'Tcl',
	},
	['terminal'] = {
		icon = '',
		color = '#31B53E',
		cterm_color = '71',
		name = 'Terminal',
	},
	['tex'] = {
		icon = 'ﭨ',
		color = '#3D6117',
		cterm_color = '58',
		name = 'Tex',
	},
	['toml'] = {
		icon = '',
		color = '#6d8086',
		cterm_color = '66',
		name = 'Toml',
	},
	['tres'] = {
		icon = '',
		color = '#cbcb41',
		cterm_color = '185',
		name = 'TextResource',
	},
	['ts'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Ts',
	},
	['tscn'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'TextScene',
	},
	['tsx'] = {
		icon = '',
		color = '#519aba',
		cterm_color = '67',
		name = 'Tsx',
	},
	['twig'] = {
		icon = '',
		color = '#8dc149',
		cterm_color = '107',
		name = 'Twig',
	},
	['txt'] = {
		icon = '',
		color = '#89e051',
		cterm_color = '113',
		name = 'Txt',
	},
	['v'] = {
		icon = '',
		color = '#019833',
		cterm_color = '29',
		name = 'Verilog',
	},
	['vh'] = {
		icon = '',
		color = '#019833',
		cterm_color = '29',
		name = 'Verilog',
	},
	['vhd'] = {
		icon = '',
		color = '#019833',
		cterm_color = '29',
		name = 'VHDL',
	},
	['vhdl'] = {
		icon = '',
		color = '#019833',
		cterm_color = '29',
		name = 'VHDL',
	},
	['vim'] = {
		icon = '',
		color = '#019833',
		cterm_color = '29',
		name = 'Vim',
	},
	['vue'] = {
		icon = '﵂',
		color = '#8dc149',
		cterm_color = '107',
		name = 'Vue',
	},
	['webmanifest'] = {
		icon = '',
		color = '#f1e05a',
		cterm_color = '221',
		name = 'Webmanifest',
	},
	['webp'] = {
		icon = '',
		color = '#a074c4',
		cterm_color = '140',
		name = 'Webp',
	},
	['webpack'] = {
		icon = 'ﰩ',
		color = '#519aba',
		cterm_color = '67',
		name = 'Webpack',
	},
	['xcplayground'] = {
		icon = '',
		color = '#e37933',
		cterm_color = '173',
		name = 'XcPlayground',
	},
	['xls'] = {
		icon = '',
		color = '#207245',
		cterm_color = '23',
		name = 'Xls',
	},
	['xml'] = {
		icon = '謹',
		color = '#e37933',
		cterm_color = '173',
		name = 'Xml',
	},
	['xul'] = {
		icon = '',
		color = '#e37933',
		cterm_color = '173',
		name = 'Xul',
	},
	['yaml'] = {
		icon = '',
		color = '#6d8086',
		cterm_color = '66',
		name = 'Yaml',
	},
	['yml'] = {
		icon = '',
		color = '#6d8086',
		cterm_color = '66',
		name = 'Yml',
	},
	['zig'] = {
		icon = '',
		color = '#f69a1b',
		cterm_color = '208',
		name = 'Zig',
	},
	['zsh'] = {
		icon = '',
		color = '#89e051',
		cterm_color = '113',
		name = 'Zsh',
	},
	['sol'] = {
		icon = 'ﲹ',
		color = '#519aba',
		cterm_color = '67',
		name = 'Solidity',
	},
}

-- Map of filetypes -> icon names
local filetypes = {
	['Brewfile'] = 'Brewfile',
	['COMMIT'] = 'COMMIT_EDITMSG',
	['COPYING'] = 'COPYING',
	['Gemfile'] = 'Gemfile$',
	['LESSER'] = 'COPYING.LESSER',
	['LICENSE'] = 'LICENSE',
	['Vagrantfile'] = 'Vagrantfile$',
	['awk'] = 'awk',
	['bmp'] = 'bmp',
	['c'] = 'c',
	['cfg'] = 'cfg',
	['clojure'] = 'clj',
	['cmake'] = 'cmake',
	['cobol'] = 'cobol',
	['coffee'] = 'coffee',
	['conf'] = 'conf',
	['cp'] = 'cp',
	['cpp'] = 'cpp',
	['cr'] = 'cr',
	['cs'] = 'cs',
	['csh'] = 'csh',
	['cson'] = 'cson',
	['css'] = 'css',
	['csv'] = 'csv',
	['d'] = 'd',
	['dart'] = 'dart',
	['desktop'] = 'desktop',
	['diff'] = 'diff',
	['doc'] = 'doc',
	['dockerfile'] = 'dockerfile',
	['dosbatch'] = 'bat',
	['dosini'] = 'ini',
	['drools'] = 'drl',
	['dropbox'] = 'dropbox',
	['dump'] = 'dump',
	['eex'] = 'eex',
	['ejs'] = 'ejs',
	['elixir'] = 'ex',
	['elm'] = 'elm',
	['epuppet'] = 'epp',
	['erlang'] = 'erl',
	['eruby'] = 'erb',
	['fennel'] = 'fnl',
	['fish'] = 'fish',
	['forth'] = 'fs',
	['fortran'] = 'f#',
	['fsi'] = 'fsi',
	['fsscript'] = 'fsscript',
	['fsx'] = 'fsx',
	['gd'] = 'gd',
	['gif'] = 'gif',
	['git'] = 'git',
	['gitconfig'] = '.gitconfig',
	['glb'] = 'glb',
	['go'] = 'go',
	['godot'] = 'godot',
	['gruntfile'] = 'gruntfile',
	['gulpfile'] = 'gulpfile',
	['haml'] = 'haml',
	['haskell'] = 'hs',
	['hbs'] = 'hbs',
	['heex'] = 'heex',
	['html'] = 'html',
	['ico'] = 'ico',
	['idlang'] = 'pro',
	['import'] = 'import',
	['java'] = 'java',
	['javascript'] = 'js',
	['javascript.jsx'] = 'jsx',
	['javascriptreact'] = 'jsx',
	['jpeg'] = 'jpeg',
	['jpg'] = 'jpg',
	['json'] = 'json',
	['julia'] = 'jl',
	['kotlin'] = 'kt',
	['leex'] = 'leex',
	['less'] = 'less',
	['lhaskell'] = 'lhs',
	['license'] = 'license',
	['lprolog'] = 'sig',
	['lua'] = 'lua',
	['make'] = 'makefile',
	['markdown'] = 'markdown',
	['material'] = 'material',
	['mdx'] = 'mdx',
	['mint'] = 'mint',
	['motoko'] = 'mo',
	['mustache'] = 'mustache',
	['nim'] = 'nim',
	['nix'] = 'nix',
	['node'] = 'node_modules',
	['ocaml'] = 'ml',
	['opus'] = 'opus',
	['otf'] = 'otf',
	['pck'] = 'pck',
	['pdf'] = 'pdf',
	['perl'] = 'pl',
	['php'] = 'php',
	['plaintex'] = 'tex',
	['png'] = 'png',
	['postscr'] = 'ai',
	['ppt'] = 'ppt',
	['procfile'] = 'procfile',
	['ps1'] = 'ps1',
	['psb'] = 'psb',
	['psd'] = 'psd',
	['puppet'] = 'pp',
	['pyc'] = 'pyc',
	['pyd'] = 'pyd',
	['pyo'] = 'pyo',
	['python'] = 'py',
	['r'] = 'r',
	['rlib'] = 'rlib',
	['rmd'] = 'rmd',
	['rproj'] = 'rproj',
	['ruby'] = 'rb',
	['rust'] = 'rs',
	['sass'] = 'sass',
	['scala'] = 'scala',
	['scss'] = 'scss',
	['sh'] = 'sh',
	['slim'] = 'slim',
	['sln'] = 'sln',
	['sml'] = 'sml',
	['solidity'] = 'sol',
	['sql'] = 'sql',
	['sqlite'] = 'sqlite',
	['sqlite3'] = 'sqlite3',
	['styl'] = 'styl',
	['sublime'] = 'sublime',
	['suo'] = 'suo',
	['svelte'] = 'svelte',
	['svg'] = 'svg',
	['swift'] = 'swift',
	['systemverilog'] = 'sv',
	['tads'] = 't',
	['tcl'] = 'tcl',
	['terminal'] = 'terminal',
	['toml'] = 'toml',
	['tres'] = 'tres',
	['tscn'] = 'tscn',
	['twig'] = 'twig',
	['txt'] = 'txt',
	['typescript'] = 'ts',
	['typescriptreact'] = 'tsx',
	['verilog'] = 'v',
	['vhdl'] = 'vhd',
	['vim'] = 'vim',
	['vue'] = 'vue',
	['webp'] = 'webp',
	['webpack'] = 'webpack',
	['xcplayground'] = 'xcplayground',
	['xls'] = 'xls',
	['xml'] = 'xml',
	['yaml'] = 'yaml',
	['zig'] = 'zig',
	['zsh'] = 'zsh',
}

local default_icon = {
	icon = '',
	color = '#6d8086',
	cterm_color = '66',
	name = 'Default',
}

local global_opts = {
	override = {},
	default = false,
}

local function get_highlight_name(data)
	return data.name and 'DevIcon' .. data.name
end

local function set_up_highlight(icon_data)
	local hl_group = get_highlight_name(icon_data)
	if hl_group then
		local highlight_command = 'highlight! ' .. hl_group

		if icon_data.color then
			highlight_command = highlight_command .. ' guifg=' .. icon_data.color
		end

		if icon_data.cterm_color then
			highlight_command = highlight_command .. ' ctermfg=' .. icon_data.cterm_color
		end

		if icon_data.color or icon_data.cterm_color then
			vim.api.nvim_command(highlight_command)
		end
	end
end

local function highlight_exists(group)
	if not group then
		return
	end

	local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
	return ok and not (hl or {})[true]
end

local function set_up_highlights()
	for _, icon_data in pairs(icons) do
		local has_color = icon_data.color or icon_data.cterm_color
		local name_valid = icon_data.name and not highlight_exists(get_highlight_name(icon_data))
		if has_color and name_valid then
			set_up_highlight(icon_data)
		end
	end
end

local function get_highlight_foreground(icon_data)
	return string.format('#%06x', vim.api.nvim_get_hl_by_name(get_highlight_name(icon_data), true).foreground)
end

local function get_highlight_ctermfg(icon_data)
	local _, _, ctermfg = string.find(vim.fn.execute('highlight ' .. get_highlight_name(icon_data)), 'ctermfg=(%d+)')
	return ctermfg
end

local loaded = false

local function setup(opts)
	if loaded then
		return
	end

	loaded = true

	local user_icons = opts or {}

	if user_icons.default then
		global_opts.default = true
	end

	if user_icons.override and user_icons.override.default_icon then
		default_icon = user_icons.override.default_icon
	end

	icons = vim.tbl_extend('force', icons, user_icons.override or {})

	table.insert(icons, default_icon)

	set_up_highlights()

	vim.cmd([[augroup NvimWebDevicons]])
	vim.cmd([[autocmd!]])
	vim.cmd([[autocmd ColorScheme * lua require('nvim-web-devicons').set_up_highlights()]])
	vim.cmd([[augroup END]])
end

local function get_icon(name, ext, opts)
	ext = ext or name:match('^.*%.(.*)$') or ''
	if not loaded then
		setup()
	end

	local has_default = (opts and opts.default) or global_opts.default
	local icon_data = icons[name] or icons[ext] or (has_default and default_icon)

	if icon_data then
		return icon_data.icon, get_highlight_name(icon_data)
	end
end

local function get_icon_name_by_filetype(ft)
	return filetypes[ft]
end

local function get_icon_by_filetype(ft, opts)
	local name = get_icon_name_by_filetype(ft)
	return get_icon(name or '', nil, opts)
end

local function get_icon_colors(name, ext, opts)
	ext = ext or name:match('^.*%.(.*)$') or ''
	if not loaded then
		setup()
	end

	local has_default = (opts and opts.default) or global_opts.default
	local icon_data = icons[name] or icons[ext] or (has_default and default_icon)

	if icon_data then
		local color = icon_data.color
		local cterm_color = icon_data.cterm_color
		if icon_data.name and highlight_exists(get_highlight_name(icon_data)) then
			color = get_highlight_foreground(icon_data) or color
			cterm_color = get_highlight_ctermfg(icon_data) or cterm_color
		end
		return icon_data.icon, color, cterm_color
	end
end

local function get_icon_colors_by_filetype(ft, opts)
	local name = get_icon_name_by_filetype(ft)
	return get_icon_colors(name or '', nil, opts)
end

local function get_icon_color(name, ext, opts)
	local data = { get_icon_colors(name, ext, opts) }
	return data[1], data[2]
end

local function get_icon_color_by_filetype(ft, opts)
	local name = get_icon_name_by_filetype(ft)
	return get_icon_color(name or '', nil, opts)
end

local function get_icon_cterm_color(name, ext, opts)
	local data = { get_icon_colors(name, ext, opts) }
	return data[1], data[3]
end

local function get_icon_cterm_color_by_filetype(ft, opts)
	local name = get_icon_name_by_filetype(ft)
	return get_icon_cterm_color(name or '', nil, opts)
end

local function set_icon(user_icons)
	icons = vim.tbl_extend('force', icons, user_icons or {})
	for _, icon_data in pairs(user_icons) do
		set_up_highlight(icon_data)
	end
end

local function set_default_icon(icon, color, cterm_color)
	default_icon.icon = icon
	default_icon.color = color
	default_icon.cterm_color = cterm_color
	set_up_highlight(default_icon)
end

return {
	get_icon = get_icon,
	get_icon_colors = get_icon_colors,
	get_icon_color = get_icon_color,
	get_icon_cterm_color = get_icon_cterm_color,
	get_icon_name_by_filetype = get_icon_name_by_filetype,
	get_icon_by_filetype = get_icon_by_filetype,
	get_icon_colors_by_filetype = get_icon_colors_by_filetype,
	get_icon_color_by_filetype = get_icon_color_by_filetype,
	get_icon_cterm_color_by_filetype = get_icon_cterm_color_by_filetype,
	set_icon = set_icon,
	set_default_icon = set_default_icon,
	setup = setup,
	has_loaded = function()
		return loaded
	end,
	get_icons = function()
		return icons
	end,
	set_up_highlights = set_up_highlights,
}
