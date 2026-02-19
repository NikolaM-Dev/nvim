local api, command, fn = vim.api, vim.api.nvim_create_user_command, vim.fn
local logger = nkl.logger:new('Commands')

command('JQFmt', function()
	local buf = api.nvim_get_current_buf()
	local path = api.nvim_buf_get_name(buf)
	if path == '' then
		logger:error('JQFmt requires a saved file')
		return
	end

	local filetype = vim.bo.filetype
	if filetype ~= 'json' and filetype ~= 'jsonc' then
		logger:error('JQFmt only runs on JSON or JSONC buffers')
		return
	end

	if vim.bo.modified then
		logger:error('Save the buffer before running JQFmt')
		return
	end

	local tmp = fn.tempname()
	local cmd = string.format(
		'jq --sort-keys . %s > %s && mv %s %s',
		fn.shellescape(path),
		fn.shellescape(tmp),
		fn.shellescape(tmp),
		fn.shellescape(path)
	)
	local result = fn.system(cmd)
	if vim.v.shell_error ~= 0 then
		logger:error('JQFmt failed: ' .. fn.trim(result))
		return
	end

	logger:info('JQFmt formatted ' .. fn.fnamemodify(path, ':t'))
	api.nvim_command('checktime')
end, { desc = '󰘳 Sort JSON keys with jq' })

command('StraightQuotes', function()
	-- Check if the buffer is modifiable
	if not vim.bo['modifiable'] then
		return
	end

	local function safe_substitute(pattern, replacement)
		-- bail early if nothing matches
		if vim.fn.search(pattern, 'nw') == 0 then
			return
		end

		-- perform a silent global substitute
		local cmd = string.format('silent! %s/%s/%s/g', '%s', pattern, replacement)
		vim.cmd(cmd)
	end

	safe_substitute('[„“‟”〝〞]', '"')
	safe_substitute('[’‘‛❛❜]', '\'')

	logger:info('Quotes Straightened')
end, { desc = '󰘳 Replace curly quotes with straight ones' })

command('RemoveDoubleJumpLines', function()
	vim.cmd('%s/\\n\\n/\\r/g')
	logger:info('Spaces removed')
end, { desc = '󰘳 Remove all the spaces between lines' })

command('CommitRoadmap', function()
	local cwd = vim.fn.getcwd()
	local roadmap_path = cwd .. '/ROADMAP.md'

	-- Check git status for changes
	local status = vim.fn.systemlist('git status --porcelain ' .. vim.fn.shellescape(roadmap_path))
	if #status == 0 then
		logger:info('No changes in ROADMAP.md to commit')
		return
	end

	-- Stage the file
	local add_res = vim.fn.system('git add ' .. vim.fn.shellescape(roadmap_path))
	if vim.v.shell_error ~= 0 then
		logger:error('Failed to stage ROADMAP.md: ' .. add_res)
		return
	end

	-- Commit
	local msg = 'docs(roadmap): Change roadmap state'
	local commit_res = vim.fn.system('git commit -m ' .. vim.fn.shellescape(msg))
	if vim.v.shell_error ~= 0 then
		logger:error('Git commit failed: ' .. commit_res)
		return
	end

	logger:info('Committed ROADMAP.md')
end, { desc = '󰘳 Commit ROADMAP changes' })
