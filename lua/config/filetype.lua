vim.filetype.add({
	extension = {
		snap = 'html',
		tmpl = 'html',
	},
	pattern = {
		['.env.*'] = 'sh',
	},
})
