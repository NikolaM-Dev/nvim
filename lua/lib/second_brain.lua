---@class nkl.lib.second_brain
local M = {}

---Resolve the `SECOND_BRAIN_PATH/src` path from the environment.
---Returns `nil` when the environment variable is not set.
---@return string|nil
function M.get_second_brain_path()
	local base = os.getenv('SECOND_BRAIN_PATH')
	if not base or base == '' then
		return nil
	end

	return base .. '/src'
end

---Verify if the cwd is the second brain `src` path.
---This is safe: it returns `false` when `SECOND_BRAIN_PATH` is not set.
---@return boolean
function M.is_second_brain_path()
	local second_brain_path = M.get_second_brain_path()
	if not second_brain_path then
		return false
	end

	local cwd = vim.fn.getcwd()
	return cwd == second_brain_path
end

---Verify if the current file is a note in my second brain
---@return boolean
function M.is_second_brain_note()
	return vim.bo.filetype == 'markdown' and M.is_second_brain_path()
end

---Create an autocmd to format Markdown headings to title-case but only if in my second brain
function M.create_format_headings_autocmd()
	vim.api.nvim_create_autocmd('BufWritePre', {
		desc = '󰁨  Format Markdown headings to title-case',
		group = nkl.augroup('format_markdown_headings_to_title_case'),
		pattern = '*.md',

		callback = function()
			if not M.is_second_brain_note() then
				return
			end

			local bufnr = vim.api.nvim_get_current_buf()
			local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

			for i, line in ipairs(lines) do
				if line:match('^#+%s') then
					local hashes, title = line:match('^(#+)%s*(.*)$')
					if title and title ~= '' then
						local formatted = nkl.string.title_case(title)
						lines[i] = hashes .. ' ' .. formatted
					end
				end
			end

			vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
		end,
	})
end

---Rename the current Markdown note to match its first-level heading and update references.
---
---Finds the first-level heading (a line starting with `# `) and renames the file to `<Title>.md` in the same directory when they differ.
---If available, updates references across the workspace using `rg` and `sd`, and finally triggers `ZkIndex` to force re-indexing.
---
---Notes:
---  - Exits early if buffer has no file, file is not a second-brain note, or the target filename already exists.
---  - `rg` and `sd` are optional; the references update step is skipped if they're unavailable.
function M.rename_note()
	local logger = nkl.logger:new('󰗚  Second Brain Lib')

	-- current buffer and file
	local buf = vim.api.nvim_get_current_buf()
	local buf_name = vim.api.nvim_buf_get_name(buf)
	if buf_name == '' then
		logger:error('No file in buffer')
		return
	end

	if not M.is_second_brain_note() then
		logger:error('Not a second brain note')
		return
	end

	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	local current_title
	for _, line in ipairs(lines) do
		local t = line:match('^#%s*(.+)')
		if t and t ~= '' then
			current_title = t
			break
		end
	end

	if not current_title then
		logger:error('Title not found')
		return
	end

	local filename_noext = vim.fn.fnamemodify(buf_name, ':t:r')
	if current_title == filename_noext then
		logger:info('Filename already matches title; nothing to do')
		return
	end

	local new_path = vim.fn.fnamemodify(buf_name, ':p:h') .. '/' .. current_title .. '.md'
	if vim.fn.filereadable(new_path) == 1 then
		logger:error('Target file already exists: ' .. new_path)
		return
	end

	-- open moved file and cleanup
	vim.fn.mkdir(vim.fn.fnamemodify(new_path, ':h'), 'p')
	vim.fn.rename(buf_name, new_path)
	vim.cmd.edit(vim.fn.fnameescape(new_path))
	if vim.api.nvim_buf_is_valid(buf) then
		vim.api.nvim_buf_delete(buf, { force = true })
	end

	logger:info(string.format('%s renamed to %s', filename_noext, current_title))

	-- verify commands
	if vim.fn.executable('sd') == 0 then
		logger:warn('`sd` not available; skipping references update')
		return
	end

	if vim.fn.executable('rg') == 0 then
		logger:warn('`rg` not available; skipping references update')
		return
	end

	-- update references
	local cmd = string.format(
		' rg -lF --hidden --no-ignore-vcs %q | xargs -d "\n" sd %q %q',
		filename_noext,
		filename_noext,
		current_title
	)

	local out = vim.fn.system(cmd)
	if vim.v.shell_error ~= 0 then
		logger:error('References update failed: ' .. out)
		return
	end

	-- force zk indexing
	vim.cmd('ZkIndex')
	logger:info('References updated')
end

return M
