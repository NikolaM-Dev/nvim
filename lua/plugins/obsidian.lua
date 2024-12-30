---Generate a note name with id and date prefix
---@param title string Title of the note
---@return string Note name with date prefix
local function note_id_func(title)
	local suffix = ''

	if title ~= nil then
		-- If title is given, transform it into valid file name.
		suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
	else
		-- If title is nil, just add 4 random uppercase letters to the suffix.
		for _ = 1, 4 do
			suffix = suffix .. string.char(math.random(65, 90))
		end
	end

	return tostring(os.date('%Y%m%d%H%M')) .. '-' .. suffix
end

---Get substitutions for templates
---@return table<string, function>
local function get_substitutions()
	local DAY_IN_SECONDS = 86400
	local WEEK_IN_SECONDS = DAY_IN_SECONDS * 7

	return {
		yesterday = function()
			return os.date('%Y-%m-%d', os.time() - DAY_IN_SECONDS)
		end,

		tomorrow = function()
			return os.date('%Y-%m-%d', os.time() + DAY_IN_SECONDS)
		end,

		current_week = function()
			return os.date('%Y-W%W', os.time() + DAY_IN_SECONDS)
		end,

		next_week = function()
			return os.date('%Y-W%W', os.time() + WEEK_IN_SECONDS + DAY_IN_SECONDS)
		end,

		last_week = function()
			return os.date('%Y-W%W', os.time() - WEEK_IN_SECONDS + DAY_IN_SECONDS)
		end,
	}
end

---@type LazySpec
return {
	'epwalsh/obsidian.nvim',
	enabled = true,

	version = '*',
	ft = 'markdown',
	cmd = {
		'ObsidianBacklinks',
		'ObsidianDailies',
		'ObsidianLinks',
		'ObsidianQuickSwitch',
		'ObsidianToday',
	},
	keys = {
		{
			'<leader>or',
			function()
				vim.ui.input({ prompt = 'Enter Note Title: ' }, function(note_title)
					if note_title == nil or note_title == '' then
						return
					end

					local note_id = note_id_func(note_title)

					vim.cmd('ObsidianRename ' .. note_id .. ' --dry-run')
				end)
			end,
			desc = '[O]sidian [R]ename',
		},
		{ '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = '[O]bisidan [B]acklinks' },
		{ '<leader>od', '<cmd>ObsidianDailies -1<cr>', desc = '[O]sidian [D]ailies' },
		{ '<leader>oe', ':ObsidianExtractNote ', desc = '[O]sidian [E]xtract Note', mode = { 'v' } },
		{ '<leader>ofn', ':ObsidianNew z/FN/', desc = '[O]sidian New [F]leeting [N]ote' },
		{ '<leader>ol', '<cmd>ObsidianLinks<cr>', desc = '[O]sidian [L]inks' },
		{ '<leader>oln', ':ObsidianNew z/LN', desc = '[O]sidian New [L]iterature [N]ote' },
		{ '<leader>on', ':ObsidianNew ', desc = '[O]sidian [N]ew' },
		{ '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = '[O]pen in [O]bsidian' },
		{ '<leader>opn', ':ObsidianNew z/PN', desc = '[O]sidian New [P]ermanet [Note]' },
		{ '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', '[O]sidian [Q]uick Swith' },
		{ '<leader>os', '<cmd>ObsidianSearch<cr>', desc = '[O]sidian [S]earch' },
		{ '<leader>ot', '<cmd>ObsidianTags<cr>', desc = '[O]sidian [T]ags' },
		{
			'<leader>pi',
			function()
				vim.ui.input({ prompt = 'Enter Image Name: ' }, function(image_name)
					if image_name == nil or image_name == '' then
						vim.notify('Image name cannot be empty', vim.log.levels.ERROR)

						return
					end

					local sufix = tostring(os.date('%Y%m%d%H%M%S'))
						.. '-'
						.. image_name:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()

					vim.cmd('ObsidianPasteImg ' .. sufix)
				end)
			end,
			desc = 'obsidian [P]aste [I]mage',
		},
		{ '<leader><leader>ot', '<cmd>ObsidianTemplate<cr>', desc = '[O]sidian [T]template' },
	},
	config = function()
		---@diagnostic disable: missing-fields
		require('obsidian').setup({
			attachments = {
				img_folder = '999-assets',
			},
			completion = {
				min_chars = 2,
				nvim_cmp = true,
			},
			daily_notes = {
				alias_format = '%A, %d %B %Y',
				date_format = '%Y-%m-%d',
				folder = 'calendar/0-daily',
				template = 'daily.md',
			},
			follow_url_func = function(url)
				vim.fn.jobstart({ 'xdg-open', url })
			end,
			mappings = {
				['<leader>ch'] = {
					action = function()
						return require('obsidian').util.toggle_checkbox()
					end,
					opts = { buffer = true, desc = 'Toggle [C][H]eck boxes' },
				},
				['<cr>'] = {
					action = function()
						return require('obsidian').util.gf_passthrough()
					end,
					opts = { buffer = true, expr = true },
				},
			},
			new_notes_location = 'current_dir',

			---@param note obsidian.Note
			note_frontmatter_func = function(note)
				if note.title then
					note:add_alias(note.title)
				end

				local current_date = os.date('%Y-%m-%d, %H:%M')

				local frontmatter = {
					aliases = note.aliases,
					created_at = current_date,
					id = note.id,
					tags = note.tags,
					updated_at = current_date,
				}

				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						frontmatter[k] = v
					end
				end

				frontmatter.updated_at = current_date

				return frontmatter
			end,
			note_id_func = note_id_func,
			-- notes_subdir = 'z',

			-- templates = {
			-- 	subdir = '900-templates',
			-- 	substitutions = get_substitutions(),
			-- },
			ui = {
				bullets = { char = '•', hl_group = 'ObsidianBullet' },
				checkboxes = {},
				enable = false,
				external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
				highlight_text = { hl_group = 'ObsidianHighlightText' },
				reference_text = { hl_group = 'ObsidianRefText' },
				tags = { hl_group = 'ObsidianTag' },
				update_debounce = 284,
				hl_groups = require('rose-pine.plugins.obsidian'),
				-- hl_groups = {
				-- 	ObsidianBullet = { bold = true, fg = '#89ddff' },
				-- 	ObsidianDone = { bold = true, fg = '#89ddff' },
				-- 	ObsidianExtLinkIcon = { bold = true, fg = '#c792ea' },
				-- 	ObsidianHighlightText = { bg = '#75662e' },
				-- 	ObsidianRefText = { bold = true, fg = '#c792ea', underline = true },
				-- 	ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
				-- 	ObsidianTag = { italic = true, fg = '#89ddff' },
				-- 	ObsidianTilde = { bold = true, fg = '#ff5370' },
				-- 	ObsidianTodo = { bold = true, fg = '#f78c6c' },
				-- },
			},
			wiki_link_func = 'prepend_note_id',
			workspaces = {
				{ name = 'second-brain.md', path = '~/Documents/second-brain.md' },
			},
		})
	end,
}
