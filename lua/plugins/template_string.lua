return {
	'axelvc/template-string.nvim',
	event = 'InsertEnter',
	config = function()
		require('template-string').setup({
			filetypes = {
				'astro',
				'javascript',
				'javascriptreact',
				'typescript',
				'typescriptreact',
			},
			remove_template_string = true, -- WARN: Don't work
		})
	end,
}
