vim.filetype.add({
	extension = {
		gitconfig = 'gitconfig',
		rasi = 'css',
		snap = 'html',
		tmpl = 'html',
	},
	pattern = {
		['.env.*'] = 'sh',
	},
})
