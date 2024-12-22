local telescope = require('telescope')
local templates = require('telescope.nzk.templates')

return telescope.register_extension({
	exports = {
		templates = templates.run_templates_picker,
	},

	---@diagnostic disable-next-line: unused-local
	setup = function(ext_config, config) end,
})
