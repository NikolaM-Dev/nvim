local actions = require('telescope.actions')
local conf = require('telescope.config').values
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')

local function my_find(opts)
	pickers
		.new(opts, {
			prompt_title = ' Tempaltes',
			finder = finders.new_oneshot_job({ 'fd', '-e', 'md', '.', '/home/nikola/.config/nvim/templates' }, {}),
			sorter = conf.file_sorter(),
			previewer = conf.file_previewer(opts),
			attach_mappings = function(prompt_bufnr, map)
				map('i', '<CR>', function()
					local selection = actions.get_selected_entry(prompt_bufnr)
					local file_to_copy = selection.value

					local current_directory = vim.fn.getcwd()
					local cmd = string.format('cp %s %s', file_to_copy, current_directory)
					vim.fn.system(cmd)

					actions.close(prompt_bufnr)
				end)
				return true
			end,
		})
		:find()
end

return require('telescope').register_extension({
	exports = {
		my_find = my_find,
	},
})
