---@type LazySpec
return {
	'danielfalk/smart-open.nvim',
	enabled = true,

	branch = '0.2.x',
	keys = {
		{
			'<leader>ff',
			function()
				local opts = require('telescope.themes').get_dropdown({
					no_ignore = true,
					previewer = false,
				})

				require('telescope').extensions.smart_open.smart_open(opts)
			end,
			desc = '[F]ind Smart Open',
		},
	},
	config = function()
		require('telescope').load_extension('smart_open')

		local config = require('smart-open').config

		config.cwd_only = true
		config.open_buffer_indicators = { others = ' ', previous = ' ' }
		config.show_scores = true

		-- TODO: Review this
		-- config.ignore_patterns = {
		-- 	'*~',
		-- 	'~:',
		-- 	'*.7z',
		-- 	'*.apk',
		-- 	'*.avif',
		-- 	'*.bak',
		-- 	'*.bin',
		-- 	'*.bmp',
		-- 	'*build/*',
		-- 	'*.bz2',
		-- 	'*.class',
		-- 	'*.ctags',
		-- 	'*.cur',
		-- 	'*.db',
		-- 	'*debug/*',
		-- 	'*.dll',
		-- 	'*.doc',
		-- 	'*.doc',
		-- 	'*.DS_Store',
		-- 	'*.gif',
		-- 	'*.git/*',
		-- 	'*.gz',
		-- 	'*.heif',
		-- 	'*.ico',
		-- 	'*.ico',
		-- 	'*.jar',
		-- 	'*.jpeg',
		-- 	'*.jpg',
		-- 	'*.jxl',
		-- 	'*.lock',
		-- 	'*.lzma',
		-- 	'*.min.gzip.js',
		-- 	'*.min.js',
		-- 	'*.node',
		-- 	'oil',
		-- 	'*.otf',
		-- 	'*.pack',
		-- 	'*.pcf',
		-- 	'*.pdb',
		-- 	'*.pdf',
		-- 	'*.pdf',
		-- 	'*.png',
		-- 	'*.ppt',
		-- 	'*.pyc',
		-- 	'*.rar',
		-- 	'*.rlib',
		-- 	'*.rmeta',
		-- 	'*.ser',
		-- 	'*.sfd',
		-- 	'*.so',
		-- 	'*.so',
		-- 	'*.spl',
		-- 	'*.svg',
		-- 	'*.swp',
		-- 	'*.tif',
		-- 	'*.tiff',
		-- 	'*.ttf',
		-- 	'*.wasm',
		-- 	'*.woff*',
		-- 	'*.xls',
		-- 	'*.zip',
		-- }
	end,
}
