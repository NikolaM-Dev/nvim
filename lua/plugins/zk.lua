---@type LazySpec
return {
	'zk-org/zk-nvim',
	enabled = true,

	event = 'VeryLazy',
	-- TODO: Review
	-- cond = function()
	-- 	local cwd = vim.fn.getcwd()
	--
	-- 	return string.find(cwd, 'second%-brain%.md') ~= nil
	-- end,

	keys = {
		{ '<leader>zb', '<cmd>ZkBacklinks<cr>', desc = '[Z]k [B]acklinks' },
		{ '<leader>ze', '<cmd>ZkNotes { sort = { \'modified\' } }<cr>', desc = '[Z]k [E]dit' },
		{ '<leader>zl', '<cmd>ZkLinks<cr>', desc = '[Z]k [L]inks' },
		{ '<leader>zn', '<cmd>Telescope nzk templates<cr>', desc = 'n[Z]k [T]emplates' },
		{ '<leader>zt', '<cmd>ZkTags<cr>', desc = '[Z]k [T]ags' },
	},

	---@type table
	opts = {
		picker = 'telescope',

		lsp = {
			config = {
				cmd = { 'zk', 'lsp', '--log', '/tmp/zk-lsp.log' },
				name = 'zk',
			},

			auto_attach = {
				enabled = false,
				filetypes = { 'markdown' },
			},
		},
	},

	---@param opts? table
	config = function(_, opts)
		require('zk').setup(opts)

		-- local cmd = require('zk.commands')
		-- local Map = require('lib.map')
		--
		-- map.set('n', '<cr>', vim.lsp.buf.definition)
		-- map.set('n', 'zn', ':ZkNew {title = vim.fn.input(\'Title: \'), dir = vim.fn.input(\'Dir: \')}<cr>')
		-- map.set('n', 'st', ':ZkTags<cr>')
		-- map.set('n', 'sf', ':ZkNotes {excludeHrefs = {\'d\'}}<cr>')
		-- map.set('n', 'so', ':ZkLinks<cr>')
		-- map.set('n', 'si', ':ZkBacklinks<cr>')
		-- map.set('i', '<C-r>', function()
		-- 	-- vim.cmd('norm! i') -- otherwise link gets inserted after cursor
		-- 	cmd.get('ZkInsertLink')()
		-- 	-- vim.cmd('normA')
		-- end)
		--
		-- map.set('n', 'zd', function()
		-- 	local year = vim.fn.strftime('%Y')
		-- 	local dateISO = vim.fn.strftime('%Y-%m-%d')
		-- 	local diary_dir = 'd/' .. year
		--
		-- 	-- local notebook_root = util.notebook_root(vim.fn.expand("%:p"))
		-- 	local filename = dateISO
		-- 	-- local path_table = { notebook_root, diary_dir, filename }
		-- 	-- local filepath = table.concat(path_table, "/") .. ".md"
		-- 	local title = ''
		-- 	-- if tjutil.file_exists(filepath) then
		-- 	-- 	vim.cmd(":e " .. filepath)
		-- 	-- else
		-- 	local subheading = vim.fn.input('Subheading: ')
		-- 	if subheading == '' then
		-- 		title = filename
		-- 	else
		-- 		title = '\'' .. filename .. ':' .. ' ' .. subheading .. '\''
		-- 	end
		-- 	cmd.get('ZkNew')({ dir = '200-areas/journal/daily', title = title })
		-- 	-- end
		-- end)
		--
		-- map.set(
		-- 	'v',
		-- 	'ze',
		-- 	':ZkNewFromContentSelection {title = vim.fn.input(\'Title: \'), dir = vim.fn.input(\'Dir: \')}<cr>'
		-- )
	end,
}
