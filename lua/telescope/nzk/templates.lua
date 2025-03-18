---@class NZKOpts
---@field content? string
---@field date? string
---@field dir? string
---@field dryRun? boolean
---@field edit? boolean
---@field extra? table
---@field group? string
---@field insertContentAtLocation? string
---@field insertLinkAtLocation? string
---@field template? string
---@field title? string

---@class NZK
---@field new fun(opts: NZKOpts)
---@field edit fun(opts: NZKOpts)
local zk = require('zk')

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local conf = require('telescope.config').values
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local themes = require('telescope.themes')

local logger = n.logger:new('ZKN Templates')

local templates = {}

---@param title string
---@return boolean
local function is_valid_title(title)
	if n.string.is_empty(title) then
		logger:error('Title is required')

		return false
	end

	return true
end

local function inbox_template()
	local rawTitle = vim.fn.input('📥 Inbox | Enter Title: ')
	local title = n.string.trim(rawTitle)

	if not is_valid_title(title) then
		return
	end

	zk.new({
		dir = '300-resources/inbox',
		template = 'inbox.md',
		title = title,
	})
end

local function fleeting_note_template()
	local rawTitle = vim.fn.input('💡FN | Enter Title: ')
	local title = n.string.trim(rawTitle)

	if not is_valid_title(title) then
		return
	end

	zk.new({
		dir = '200-areas/z/FN',
		template = 'fleeting-note.md',
		title = 'FN ' .. title,
	})
end
function templates.run_templates_picker(opts)
	local new_opts = themes.get_dropdown(opts)

	pickers
		.new(new_opts, {
			prompt_title = '  New Notes ',
			finder = finders.new_table({
				results = {
				},
			}),
			sorter = conf.generic_sorter(new_opts),
			---@diagnostic disable-next-line: unused-local
			attach_mappings = function(prompt_bufnr, _map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)

					local RUN_TEMPLATES = {
					}

					local selection = action_state.get_selected_entry()
					if not selection then
						logger:warn('Not template selected')
						return
					end

					local selected_template = selection[1]

					if RUN_TEMPLATES[selected_template] == nil then
						-- RUN_TEMPLATES.default()

						return
					end

					RUN_TEMPLATES[selected_template]()
				end)

				return true
			end,
		})
		:find()
end

return templates
