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
local templates = {}
function templates.run_templates_picker(opts)
	local new_opts = themes.get_dropdown(opts)

	pickers
		.new(new_opts, {
			finder = finders.new_table({
				results = {
				},
			}),
			sorter = conf.generic_sorter(opts),
			---@diagnostic disable-next-line: unused-local
			attach_mappings = function(prompt_bufnr, _map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
				end)

				return true
			end,
		})
		:find()
end

return templates
