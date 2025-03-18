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
