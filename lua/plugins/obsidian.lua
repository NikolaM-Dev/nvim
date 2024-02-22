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
			note_id_func = function(title)
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
			end,
			daily_notes = {
				folder = '001-calendar/dailies',
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
