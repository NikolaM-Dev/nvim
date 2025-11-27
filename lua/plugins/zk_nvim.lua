---@module 'lazy.types'
---@type LazySpec
return {
	'zk-org/zk-nvim',
	desc = 'Neovim extension for zk',
	enabled = true,

	ft = 'markdown',

	keys = {
		{ '<C-n><C-i>', '<cmd>ZkInsertLink<cr>', desc = '[Z]k [L]inks', mode = 'i' },
		{ '<leader>ze', '<cmd>ZkNotes { sort = { \'modified\' } }<cr>', desc = '[Z]k [E]dit' },
		{ 'gb', '<cmd>ZkBacklinks<cr>', desc = '[Z]k [B]acklinks' },
		{ 'gl', '<cmd>ZkLinks<cr>', desc = '[Z]k [L]inks' },
		{
			'<M-e>',
			function()
				local logger = nkl.logger:new('󰗚  ZK')
				local vis = require('obsidian.api').get_visual_selection()
				if vis == nil then
					logger:warn('`Obsidian extract_note` must be called in visual mode')
					return
				end

				if not nkl.second_brain.is_second_brain_note() then
					logger:error('Not a second brain note')
					return
				end

				local lines = vis.lines
				local title
				for _, line in ipairs(lines) do
					local t = line:match('^#%s*(.+)')
					if t and t ~= '' then
						title = t
						break
					end
				end

				local content = ''
				for _, line in ipairs(lines) do
					if nkl.string.is_empty(line) then
						content = content .. '\n'
					else
						content = content .. line .. '\n'
					end
				end

				local zk = require('zk')
				zk.new({
					content = content,
					dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':p:h') .. '/',
					title = title,
					insertLinkAtLocation = {
						range = {
							start = { line = vis.csrow - 1, character = 0 },
							['end'] = { line = vis.cerow - 1, character = #vis.lines[#vis.lines] },
						},
						uri = vim.uri_from_fname(vim.api.nvim_buf_get_name(0)),
					},
				})
				vim.defer_fn(function()
					zk.index({}, function() end)
				end, 42)
			end,
			desc = '󰪹 [E]xtract Note',
			mode = { 'v' },
		},
	},

	---@type table
	opts = {
		picker = 'snacks_picker',
		picker_options = {
			---@module 'snacks'
			---@type snacks.picker.config
			snacks_picker = {
				win = {
					preview = {
						wo = {
							wrap = true,
						},
					},
				},
			},
		},
	},

	---@param opts? table
	config = function(_, opts)
		require('zk').setup(opts)
	end,
}
