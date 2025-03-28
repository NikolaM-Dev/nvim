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

local function literature_note_template()
	local rawTitle = vim.fn.input('🎭 LN | Enter Title: ')
	local title = n.string.trim(rawTitle)

	if not is_valid_title(title) then
		return
	end

	zk.new({
		dir = '200-areas/z/LN',
		template = 'literature-note.md',
		title = 'LN ' .. title,
	})
end

local function permanent_note_template()
	local rawTitle = vim.fn.input('🏆 PN | Enter Title: ')
	local title = n.string.trim(rawTitle)

	if not is_valid_title(title) then
		return
	end

	zk.new({
		dir = '200-areas/z/PN',
		template = 'permanent-note.md',
		title = title,
	})
end

local function yesterday_template()
	logger:info('Running Template: yesterday')

	zk.new({
		dir = '200-areas/journal/0-daily',
		group = 'yesterday',
		template = 'yesterday.md',
		title = string.format('%s.md', n.date.yesterday()),
	})
end

local function today_template()
	logger:info('Running Template: today')

	zk.new({
		dir = '200-areas/journal/0-daily',
		template = 'daily.md',
		group = 'daily',
		title = string.format('%s.md', n.date.today()),
	})
end

local function tomorrow_template()
	logger:info('Running Template: tomorrow')

	zk.new({
		dir = '200-areas/journal/0-daily',
		template = 'tomorrow.md',
		group = 'tomorrow',
		title = string.format('%s.md', n.date.tomorrow()),
	})
end

local function year_template()
	logger:info('Running Template: year')

	zk.new({
		dir = '200-areas/journal/4-yearly',
		group = 'yearly',
	})
end

local function project_template()
	local rawTitle = vim.fn.input('🔥 Project | Enter Title: ')
	local title = n.string.trim(rawTitle)

	if not is_valid_title(title) then
		return
	end

	logger:info('Running Template: project')

	zk.new({
		dir = '01-projects',
		template = 'project.md',
		title = title,
	})
end

local function weekly_template()
	logger:info('Running Template: weekly')

	zk.new({
		dir = '200-areas/journal/1-weekly',
		template = 'weekly.md',
	})
end

function templates.run_templates_picker(opts)
	local new_opts = themes.get_dropdown(opts)

	pickers
		.new(new_opts, {
			prompt_title = '  New Notes ',
			finder = finders.new_table({
				results = {
					'fleeting note',
					'inbox',
					'literature note',
					'permanent note',
					'project',
					'today',
					'tomorrow',
					'weekly',
					'year',
					'yesterday',
				},
			}),
			sorter = conf.generic_sorter(new_opts),
			---@diagnostic disable-next-line: unused-local
			attach_mappings = function(prompt_bufnr, _map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)

					local RUN_TEMPLATES = {
						['fleeting note'] = fleeting_note_template,
						inbox = inbox_template,
						['literature note'] = literature_note_template,
						['permanent note'] = permanent_note_template,
						project = project_template,
						today = today_template,
						tomorrow = tomorrow_template,
						weekly = weekly_template,
						year = year_template,
						yesterday = yesterday_template,
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
