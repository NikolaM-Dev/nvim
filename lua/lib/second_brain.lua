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

return M
