local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local conf = require('telescope.config').values
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')

local function get_find_bookmarks()
	local bookmarks_fallback = vim.deepcopy(bookmarks)

	local function find_bookmarks(opts)
		opts = opts or {}

		pickers
			.new(opts, {
				prompt_title = ' 󰸕 Bookmakrs ',
				finder = finders.new_table({
					results = get_results(bookmarks),
					entry_maker = get_entry_marker,
				}),
				sorter = conf.generic_sorter(opts),
				attach_mappings = function(prompt_bufnr)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)

						local value = action_state.get_selected_entry().value

						if type(value) == 'string' then
							vim.notify(string.format('Opening %s', value), vim.log.levels.INFO)
							vim.fn.jobstart({ 'google-chrome-stable', value })

							bookmarks = bookmarks_fallback

							return
						end

						bookmarks = value

						find_bookmarks(opts)
					end)

					return true
				end,
			})
			:find()
	end

	return find_bookmarks
end

return require('telescope').register_extension({
	exports = {
		find_bookmarks = get_find_bookmarks(),
	},
})
