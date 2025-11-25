vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2

vim.opt_local.colorcolumn = '80'
vim.opt_local.textwidth = 80

local bmap = nkl.key.bmap
bmap('ia', 'att', '## Attempt')
bmap('ia', 'h1', '#')
bmap('ia', 'h2', '##')
bmap('ia', 'h3', '###')
bmap('ia', 'h4', '####')
bmap('ia', 'h5', '#####')
bmap('ia', 'h6', '######')
bmap('ia', 'h6', '######')
bmap('ia', 'hr', '---')
bmap('ia', 'itj', '—')
bmap('ia', 'ol', '1.')
bmap('ia', 'sc', '**Score:**')
bmap('ia', 'td', '- [ ]')
bmap('ia', 'ul', '-')
bmap('ia', 'ure', 'you\'re')

-- -- Add the key mappings only for Markdown files in a zk notebook.
-- if require('zk.util').notebook_root(vim.fn.expand('%:p')) ~= nil then
-- 	local function map(...)
-- 		vim.api.nvim_buf_set_keymap(0, ...)
-- 	end
-- 	local opts = { noremap = true, silent = false }
--
-- 	-- Open the link under the caret.
-- 	map('n', '<CR>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--
-- 	-- Create a new note after asking for its title.
-- 	-- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
-- 	map('n', '<leader>zn', '<Cmd>ZkNew { dir = vim.fn.expand(\'%:p:h\'), title = vim.fn.input(\'Title: \') }<CR>', opts)
-- 	-- Create a new note in the same directory as the current buffer, using the current selection for title.
-- 	map('v', '<leader>znt', ':\'<,\'>ZkNewFromTitleSelection { dir = vim.fn.expand(\'%:p:h\') }<CR>', opts)
-- 	-- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
-- 	map(
-- 		'v',
-- 		'<leader>znc',
-- 		':\'<,\'>ZkNewFromContentSelection { dir = vim.fn.expand(\'%:p:h\'), title = vim.fn.input(\'Title: \') }<CR>',
-- 		opts
-- 	)
--
-- 	-- Open notes linking to the current buffer.
-- 	map('n', '<leader>zb', '<Cmd>ZkBacklinks<CR>', opts)
-- 	-- Alternative for backlinks using pure LSP and showing the source context.
-- 	--map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
-- 	-- Open notes linked by the current buffer.
-- 	map('n', '<leader>zl', '<Cmd>ZkLinks<CR>', opts)
--
-- 	-- Preview a linked note.
-- 	map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- 	-- Open the code actions for a visual selection.
-- 	map('v', '<leader>za', ':\'<,\'>lua vim.lsp.buf.range_code_action()<CR>', opts)
-- end
--
-- -- local bmap = require('lib').bmap
-- -- bmap('n', 'gb', function()
-- -- 	local file_path = vim.api.nvim_buf_get_name(0)
-- -- 	local file_path_split = vim.split(file_path, '/')
-- -- 	local filename_with_extension = file_path_split[#file_path_split]
-- -- 	local filename = vim.split(filename_with_extension, '[.]')[1]
-- --
-- -- 	---@module 'snacks.picker'
-- -- 	require('snacks').picker.grep({
-- -- 		layout = { preview = 'main', preset = 'ivy' },
-- -- 		search = '\\[' .. filename,
-- -- 		title = 'BackLinks',
-- -- 	})
-- -- end, {
-- -- 	desc = '[G]o to [B]ackLinks',
-- -- })
-- --
-- -- bmap('n', 'gl', function()
-- -- 	---@module 'snacks.picker'
-- -- 	require('snacks').picker.lines({
-- -- 		pattern = '[[',
-- -- 		title = 'Links',
-- -- 	})
-- -- end, {
-- -- 	desc = '[G]o to [L]inks',
-- -- })
-- --
-- -- -- 	{
-- -- -- 		'<leader>oo',
-- -- -- 		function()
-- -- -- 			local vault = 'second-brain.md'
-- -- -- 			local advanced = true
-- -- -- 			local relative_filepath = vim.fn.expand('%:.')
-- -- -- 			relative_filepath = relative_filepath:gsub(vault .. '/', '')
-- -- --
-- -- -- 			local char_to_hex = function(c)
-- -- -- 				return string.format('%%%02X', string.byte(c))
-- -- -- 			end
-- -- --
-- -- -- 			local function url_encode(str, opts)
-- -- -- 				opts = opts or {}
-- -- -- 				local url = str
-- -- -- 				url = url:gsub('\n', '\r\n')
-- -- -- 				url = url:gsub('([^/%w _%%%-%.~])', char_to_hex)
-- -- -- 				if not opts.keep_path_sep then
-- -- -- 					url = url:gsub('/', char_to_hex)
-- -- -- 				end
-- -- --
-- -- -- 				-- Spaces in URLs are always safely encoded with `%20`, but not always safe
-- -- -- 				-- with `+`. For example, `+` in a query param's value will be interpreted
-- -- -- 				-- as a literal plus-sign if the decoder is using JavaScript's `decodeURI`
-- -- -- 				-- function.
-- -- -- 				url = url:gsub(' ', '%%20')
-- -- -- 				return url
-- -- -- 			end
-- -- --
-- -- -- 			local encoded_vault = url_encode(vault)
-- -- -- 			local encoded_path = url_encode(relative_filepath)
-- -- -- 			local uri = ''
-- -- -- 			-- if advanced then
-- -- -- 			-- 	local line = vim.api.nvim_win_get_cursor(0)[1] or 1
-- -- -- 			-- 	uri = ('obsidian://advanced-uri?vault=%s&filepath=%s&line=%i'):format(
-- -- -- 			-- 		encoded_vault,
-- -- -- 			-- 		encoded_path,
-- -- -- 			-- 		line
-- -- -- 			-- 	)
-- -- -- 			-- else
-- -- -- 			uri = ('obsidian://open?vault=%s&file=%s'):format(encoded_vault, encoded_path)
-- -- -- 			-- end
-- -- -- 			local cmd = 'xdg-open'
-- -- -- 			local cmd_with_args = string.format('%s \'%s\'', cmd, uri)
-- -- --
-- -- -- 			vim.fn.jobstart(cmd_with_args, {
-- -- -- 				on_exit = function(_, exit_code)
-- -- -- 					if exit_code ~= 0 then
-- -- -- 						print('open command failed with exit code \'%s\': %s', exit_code, cmd)
-- -- -- 					end
-- -- -- 				end,
-- -- -- 			})
-- -- -- 		end,
-- -- -- 		desc = '[O]pen Note in [O]bsidian',
-- -- -- 	},
-- -- -- },
