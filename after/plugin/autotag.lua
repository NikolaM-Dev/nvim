local status_ok, autotag = pcall(require, 'nvim-ts-autotag')
if not status_ok then
	return
end

autotag.setup({
	filetypes = {
		'glimmer',
		'handlebars',
		'hbs',
		'html',
		'javascript',
		'javascriptreact',
		'jsx',
		'markdown',
		'php',
		'rescript',
		'svelte',
		'tsx',
		'typescript',
		'typescriptreact',
		'vue',
		'xml',
	},
	skip_tags = {
		'area',
		'base',
		'br',
		'col',
		'command',
		'embed',
		'hr',
		'img',
		'input',
		'keygen',
		'link',
		'menuitem',
		'meta',
		'param',
		'slot',
		'source',
		'track',
		'wbr',
	},
})
