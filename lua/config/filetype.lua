vim.filetype.add({
	extension = {
		gitconfig = 'gitconfig',
		snap = 'html',
		tmpl = 'html',
	},
	pattern = {
		['.env.*'] = 'sh',
	},
})
