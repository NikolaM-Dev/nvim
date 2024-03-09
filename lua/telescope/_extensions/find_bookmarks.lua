local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local conf = require('telescope.config').values
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')

---Get the domain of a URL
---Example: https://obsidian.md => obsidian.md
---@param url string: URL to which your domain will be extracted
---@return string: Domain from the URL
local function get_domain(url)
	return string.match(url, 'https?://([^/]+)')
end

local function get_results(bookmarks)
	local bookmarks_copy = vim.deepcopy(bookmarks or {})
	local results = {}

	for k, v in pairs(bookmarks_copy) do
		if type(k) == 'string' then
			table.insert(results, { k, v })
		else
			table.insert(results, v)
		end
	end

	return results
end

local function get_entry_marker(entry)
	local value, display, ordinal

	if type(entry) == 'string' then
		value = entry
		display = entry
		ordinal = entry
	elseif type(entry) == 'table' and type(entry[2]) ~= 'table' then
		value = entry[2]
		display = entry[1] .. ' ' .. '' .. ' ' .. value
		ordinal = entry[1] .. entry[2]
	elseif type(entry) == 'table' and type(entry[2]) == 'table' then
		display = entry[1] .. ' ' .. ''
		ordinal = entry[1]

		for k, v in pairs(entry[2]) do
			ordinal = ordinal .. k .. v

			if type(k) == 'string' then
				display = display .. ' ' .. k
			else
				display = display .. ' ' .. get_domain(v)
			end
		end

		value = entry[2]
		display = display
		ordinal = ordinal
	end

	return {
		value = value,
		display = display,
		ordinal = ordinal,
	}
end

---@return function
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
