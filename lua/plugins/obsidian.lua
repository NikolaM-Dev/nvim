return {
	'epwalsh/obsidian.nvim',
	version = '*',
	ft = 'markdown',
	cmd = { 'ObsidianBacklinks', 'ObsidianToday' },
	keys = {
		{ '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = '[O]bisidan [B]acklinks' },
		{ '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = '[O]pen in [O]bsidian' },
		-- d = { "<cmd>ObsidianToday<cr>", "Daily Note" },
		-- p = { '<cmd>ObsidianPasteImg<cr>', 'Paste image' },
		{ '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', '[O]sidian [Q]uick Swith' },
		{ '<leader>os', '<cmd>ObsidianSearch<cr>', '[O]sidian [S]earch' },
		{ '<leader>ot', '<cmd>ObsidianTags<cr>', '[O]sidian [T]ags' },
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
			daily_notes = {
				folder = '000-calendar/00-dailies',
				date_format = '%Y-%m-%d',
				alias_format = '%A, %d %B %Y',
				template = nil,
			},
			follow_url_func = function(url)
				vim.fn.jobstart({ 'google-chrome-stable', url })
			end,
		})
	end,
}
