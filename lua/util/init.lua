local M = {}

M.root_patterns = { '.git', 'lua' }

-- Return options
function M.opts(name)
	local plugin = require('lazy.core.config').plugins[name]
	if not plugin then
		return {}
	end
	local Plugin = require('lazy.core.plugin')
	return Plugin.values(plugin, 'opts', false)
end

-- Check for plugin presence
function M.has(plugin)
	return require('lazy.core.config').plugins[plugin] ~= nil
end

-- Toggle opts
function M.toggle(option, silent, values)
	if values then
		if vim.opt_local[option]:get() == values[1] then
			vim.opt_local[option] = values[2]
		else
			vim.opt_local[option] = values[1]
		end
		return vim.notify(
			'Set ' .. option .. ' to ' .. vim.opt_local[option]:get(),
			vim.log.levels.INFO,
			{ title = 'Option' }
		)
	end
	vim.opt_local[option] = not vim.opt_local[option]:get()
	if not silent then
		vim.notify(
			(vim.opt_local[option]:get() and 'Enabled' or 'Disabled') .. ' ' .. option,
			vim.log.levels.INFO,
			{ title = 'Option' }
		)
	end
end

-- returns the root directory based on:
-- * lsp workspace folders
-- * lsp root_dir
-- * root pattern of filename of the current buffer
-- * root pattern of cwd
function M.get_root()
	local path = vim.api.nvim_buf_get_name(0)
	path = path ~= '' and vim.loop.fs_realpath(path) or nil
	local roots = {}
	if path then
		for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
			local workspace = client.config.workspace_folders
			local paths = workspace
					and vim.tbl_map(function(ws)
						return vim.uri_to_fname(ws.uri)
					end, workspace)
				or client.config.root_dir and { client.config.root_dir }
				or {}
			for _, p in ipairs(paths) do
				local r = vim.loop.fs_realpath(p)
				if path:find(r, 1, true) then
					roots[#roots + 1] = r
				end
			end
		end
	end
	table.sort(roots, function(a, b)
		return #a > #b
	end)
	local root = roots[1]
	if not root then
		path = path and vim.fs.dirname(path) or vim.loop.cwd()
		root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
		root = root and vim.fs.dirname(root) or vim.loop.cwd()
	end
	return root
end

-- this will return a function that calls telescope.
-- cwd will defautlt to util.get_root
-- for `files`, git_files or find_files will be chosen depending on .git
function M.telescope(builtin, opts)
	local params = { builtin = builtin, opts = opts }
	return function()
		builtin = params.builtin
		opts = params.opts
		opts = vim.tbl_deep_extend('force', { cwd = M.get_root() }, opts or {})
		if builtin == 'files' then
			if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. '/.git') then
				opts.show_untracked = true
				builtin = 'git_files'
			else
				builtin = 'find_files'
			end
		end
		require('telescope.builtin')[builtin](opts)
	end
end

-- For creating new Terminal Instance
function M.open_term(cmd, opts)
	local TERMINAL = require('toggleterm.terminal').Terminal
	opts = opts or {}
	opts.size = opts.size or vim.o.columns * 0.5
	opts.direction = opts.direction or 'vertical'
	opts.on_open = opts.on_open
	opts.on_exit = opts.on_exit or nil

	local new_term = TERMINAL:new({
		cmd = cmd,
		dir = 'git_dir',
		auto_scroll = false,
		close_on_exit = false,
		start_in_insert = false,
		on_open = opts.on_open,
		on_exit = opts.on_exit,
	})
	new_term:open(opts.size, opts.direction)
end

-- For StackOverflow Assistance
function M.so_input()
	local buf = vim.api.nvim_get_current_buf()
	local file_type = vim.api.nvim_buf_get_option(buf, 'filetype')
	local current_word = vim.call('expand', '<cword>')
	vim.ui.input({ prompt = 'StackOverflow input: ', default = file_type .. ' ' .. current_word }, function(input)
		local cmd = ''
		if input == '' or not input then
			return
		elseif input == 'h' then
			cmd = '-h'
		else
			cmd = input
		end
		M.open_term('so ' .. cmd, { direction = 'float' })
	end)
end

-- Installs the package under cursor via Nvim-R
function M.R_install()
	local current_word = vim.call('expand', '<cword>')
	local rsend_command = string.format(':RSend install.packages("' .. current_word .. '")')
	vim.api.nvim_command(rsend_command)
end

-- Sort operator
function M.sort(lines, _)
	local utils = require('yop.utils')
	local sort_without_leading_space = function(a, b)
		local pattern = [[^%W*]]
		return string.gsub(a, pattern, '') < string.gsub(b, pattern, '')
	end
	if #lines == 1 then
		local delimeter = ','
		local split = vim.split(lines[1], delimeter, { trimempty = true })
		table.sort(split, sort_without_leading_space)
		return { utils.join(split, delimeter) }
	else
		table.sort(lines, sort_without_leading_space)
		return lines
	end
end

return M
