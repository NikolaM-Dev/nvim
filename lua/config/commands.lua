local api, command, fn = vim.api, vim.api.nvim_create_user_command, vim.fn
local logger = nkl.logger:new('Commands')

command('SBArchive', function()
	vim.fn.jobstart('n-sb-archive', {
		on_exit = function(_, exit_code)
			if exit_code == 0 then
				logger:info('Archive completed successfully')
			else
				logger:error('Archive failed with exit code: ' .. exit_code)
			end
		end,
	})

	vim.cmd.edit()
end, { desc = '󰘳 Archive completed tasks from second brain to today\'s journal' })

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

command('ExtractNotesQF', function(opts)
	-- Get the range of lines
	local start_line, end_line = opts.line1, opts.line2
	-- Get the current directory of the buffer
	local buffer_dir = vim.fn.expand('%:p:h')

	-- Create a table to hold the quickfix entries
	local qf_list = {}

	-- Process each line in the range
	for line_num = start_line, end_line do
		local line_content = vim.fn.getline(line_num)

		-- Extract text inside [[...]] using Lua's string.match
		-- '%[%[' matches the literal '[['
		-- '(.-)' is a non-greedy capture of any character
		-- '%]%]' matches the literal ']]'
		local extracted_text = line_content:match('%[%[(.-)%]%]')

		if extracted_text then
			-- Construct the file path
			local file_path = buffer_dir .. '/' .. extracted_text .. '.md'

			-- Create a quickfix entry
			local entry = {
				filename = file_path,
				lnum = 1, -- Jump to line 1
				col = 1, -- Jump to column 1
				text = extracted_text, -- The text to display in the quickfix window
			}

			-- Add the entry to our list
			table.insert(qf_list, entry)
		end
	end

	-- Set the quickfix list with our populated table
	vim.fn.setqflist(qf_list)

	-- Open the quickfix window to see the results
	vim.schedule(function()
		vim.cmd('copen')
	end)
end, { desc = '󰘳 Extract Notes Into Qf', range = true })

command('RemoveDatePatterns', function()
	-- Remove <MM-DD> or <YYYY-MM-DD> patterns only on lines that are marked as completed [x] or canceled [-]
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	for i, line in ipairs(lines) do
		if line:find('%[x%]') or line:find('%[%-%]') then
			local new = line:gsub(' <%d%d%d%d%-%d%d%-%d%d>', '')
			new = new:gsub(' <%d%d%-%d%d>', '')
			lines[i] = new
		end
	end
	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
	logger:info('Date patterns removed where appropriate')
end, { desc = '󰘳 Remove <MM-DD> and <YYYY-MM-DD> patterns' })

command('ToggleStatusTag', function()
	local status_tags = {
		'status/pending',
		'status/wait',
		'status/polish',
		'status/connections',
		'status/arrange',
	}

	local bufnr = api.nvim_get_current_buf()
	local lines = api.nvim_buf_get_lines(bufnr, 0, -1, false)

	-- Find front matter boundaries (lines between the --- markers)
	local front_start, front_end = nil, nil
	for i, line in ipairs(lines) do
		if line == '---' then
			if not front_start then
				front_start = i
			else
				front_end = i
				break
			end
		end
	end

	if not front_start or not front_end then
		logger:error('No YAML front matter found')
		return
	end

	-- Scan front matter for a status tag
	for i = front_start, front_end do
		for j, tag in ipairs(status_tags) do
			local pattern = vim.pesc(tag)
			if lines[i]:find(pattern) then
				-- Cycle to next status
				local next = status_tags[(j % #status_tags) + 1]
				lines[i] = lines[i]:gsub(pattern, next)
				api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
				logger:info('Toggled status: ' .. tag .. ' → ' .. next)
				return
			end
		end
	end

	-- No status tag found — insert one after front_start (typically after the opening ---)
	table.insert(lines, front_start + 1, 'tags: [' .. status_tags[1] .. ']')
	api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
	logger:info('Added status tag: ' .. status_tags[1])
end, { desc = '󰘳 Toggle Markdown Status Tag' })

command('RoadmapCommit', function()
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
