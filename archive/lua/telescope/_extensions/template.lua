local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values

local function list_templates()
	return {
		results = finders.new_oneshot_job({ 'fd', '-e', 'md', '.', '/home/nikola/.config/nvim/templates' }, {}),
		sorter = conf.file_sorter(),
	}
end

local function select_template(prompt_bufnr, map)
	local function set_template_selection(_, selection)
		vim.api.nvim_buf_set_lines(prompt_bufnr, 0, -1, false, { selection.value })
	end

	pickers
		.new(map, {
			prompt_title = '  Tempaltes ',
			finder = finders.new_table({
				finder = list_templates().results,
				sorter = conf.file_sorter(),
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry,
						ordinal = entry,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(_, map2)
				map2('i', '<CR>', set_template_selection)
				map2('n', '<CR>', set_template_selection)

				return true
			end,
		})
		:find()
end

return require('telescope').register_extension({
	exports = {
		template = select_template,
	},
})
