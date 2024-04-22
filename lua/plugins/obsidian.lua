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

	return tostring(os.date('%Y%m%d%H%M%S')) .. '-' .. suffix
end

return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	enabled = true,
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
		{ '<leader>od', '<cmd>ObsidianDailies<cr>', desc = '[O]sidian [D]ailies' },
		{ '<leader>oe', ':ObsidianExtractNote ', desc = '[O]sidian [E]xtract Note', mode = { 'v' } },
		{ '<leader>ol', '<cmd>ObsidianLinks<cr>', desc = '[O]sidian [L]inks' },
		{ '<leader>on', ':ObsidianNew ', desc = '[O]sidian [N]ew' },
		{ '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = '[O]pen in [O]bsidian' },
		{ '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', '[O]sidian [Q]uick Swith' },
		{ '<leader>os', '<cmd>ObsidianSearch<cr>', desc = '[O]sidian [S]earch' },
		{ '<leader>ot', '<cmd>ObsidianTags<cr>', desc = '[O]sidian [T]ags' },
	},
	config = function()
		---@diagnostic disable: missing-fields
		require('obsidian').setup({
			workspaces = {
				{
					name = 'second-brain.md',
					path = '~/Documents/second-brain.md',
				},
			},
			completion = {
				min_chars = 2,
			},
			attachments = {
				img_folder = '900-assets',
			},
			mappings = {
				['<leader>ch'] = {
					action = function()
						return require('obsidian').util.toggle_checkbox()
					end,
					opts = { buffer = true, desc = 'Toggle [C][H]eck boxes' },
				},
			},
			ui = {
				bullets = { char = '•', hl_group = 'ObsidianBullet' },
				checkboxes = {},
				enable = true,
				external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
				highlight_text = { hl_group = 'ObsidianHighlightText' },
				reference_text = { hl_group = 'ObsidianRefText' },
				tags = { hl_group = 'ObsidianTag' },
				update_debounce = 284,
				hl_groups = {
					ObsidianBullet = { bold = true, fg = '#89ddff' },
					ObsidianDone = { bold = true, fg = '#89ddff' },
					ObsidianExtLinkIcon = { fg = '#c792ea' },
					ObsidianHighlightText = { bg = '#75662e' },
					ObsidianRefText = { underline = true, fg = '#c792ea' },
					ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
					ObsidianTag = { italic = true, fg = '#89ddff' },
					ObsidianTilde = { bold = true, fg = '#ff5370' },
					ObsidianTodo = { bold = true, fg = '#f78c6c' },
				},
			},
			note_frontmatter_func = function(note)
				if note.title then
					note:add_alias(note.title)
				end

				local current_date = os.date('%Y-%m-%d, %I:%M %p')
				local out = {
					aliases = note.aliases,
					created_at = current_date,
					tags = note.tags,
					updated_at = current_date,
				}

				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				out.updated_at = current_date

				return out
			end,
			note_id_func = note_id_func,
				return title
			end,
			daily_notes = {
				folder = '000-calendar/00-dailies',
				date_format = '%Y-%m-%d',
				alias_format = '%A, %d %B %Y',
				template = nil,
			},
			follow_url_func = function(url)
				vim.fn.jobstart({ 'brave', url })
			end,
		})
	end,
}
