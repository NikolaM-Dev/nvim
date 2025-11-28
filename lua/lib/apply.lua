-- TODO: Make it really works
---@class nkl.lib.apply
local M = {}

---@param line1 number Start of the range
---@param line2 number End of the range
---@param cb function Callback to execute over the range
function M.on_range(line1, line2, cb)
	local buf = vim.api.nvim_get_current_buf()

	for l = line1, line2 do
		local line = vim.api.nvim_buf_get_lines(buf, l - 1, l, false)[1]
		if line ~= nil and line ~= '' then
			local new = cb(line)
			vim.api.nvim_buf_set_lines(buf, l - 1, l, false, { new })
		end
	end
end

---@param cb function Callback to execute over the range
function M.on_selection(cb)
	local buf = vim.api.nvim_get_current_buf()

	local start_pos = vim.fn.getpos('\'[')
	local end_pos = vim.fn.getpos('\']')

	local s_line, s_col = start_pos[2], start_pos[3]
	local e_line, e_col = end_pos[2], end_pos[3]

	-- Read selected text
	local lines = vim.api.nvim_buf_get_lines(buf, s_line - 1, e_line, false)

	if #lines == 0 then
		return
	end

	-- Restrict to selection columns for charwise mode
	if type == 'char' then
		if #lines == 1 then
			lines[1] = lines[1]:sub(s_col, e_col)
		else
			lines[1] = lines[1]:sub(s_col)
			lines[#lines] = lines[#lines]:sub(1, e_col)
		end
	end

	-- Join → apply → split
	local text = table.concat(lines, '\n')
	local new_text = cb(text)

	local new_lines = {}
	for l in new_text:gmatch('[^\n]+') do
		table.insert(new_lines, l)
	end

	-- Replace buffer text
	vim.api.nvim_buf_set_text(buf, s_line - 1, s_col - 1, e_line - 1, e_col, new_lines)
end

---Apply a transformer function to the visually selected text.
---@param fn fun(text: string): string  -- transforms whole text block
function M.apply_to_visual(fn)
	-- Get the start and end positions of the visual selection
	-- local mode = vim.fn.mode()
	-- if mode ~= 'v' and mode ~= 'V' and mode ~= '\22' then
	-- 	vim.notify('Not in visual mode', vim.log.levels.ERROR)
	-- 	return
	-- end

	-- Positions (0-indexed row, 0-indexed col)
	local start_pos = vim.fn.getpos('\'<')
	local end_pos = vim.fn.getpos('\'>')

	local start_line = start_pos[2]
	local start_col = start_pos[3]
	local end_line = end_pos[2]
	local end_col = end_pos[3]

	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
	if #lines == 0 then
		return
	end

	-- Extract selected text depending on line count
	local text
	if #lines == 1 then
		text = lines[1]:sub(start_col, end_col)
	else
		lines[1] = lines[1]:sub(start_col)
		lines[#lines] = lines[#lines]:sub(1, end_col)
		text = table.concat(lines, '\n')
	end

	local new = fn(text)

	-- Write back
	local new_lines = vim.split(new, '\n', { plain = true })

	if #lines == 1 then
		local orig = vim.api.nvim_buf_get_lines(0, start_line - 1, start_line, false)[1]
		local before = orig:sub(1, start_col - 1)
		local after = orig:sub(end_col + 1)
		vim.api.nvim_buf_set_lines(0, start_line - 1, start_line, false, {
			before .. new_lines[1] .. after,
		})
	else
		-- Replace whole block
		vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, new_lines)
	end
end

function M.get_visual_selection()
	local mode = vim.fn.mode()
	local pos = vim.fn.getpos('.')
	if mode == 'n' then
		return vim.fn.expand('<cword>')
	else
		vim.cmd('noau normal! "vy"')
		local text = vim.fn.getreg('v')
		vim.fn.setreg('v', {})

		text = string.gsub(text, '\n', '')
		if #text > 0 then
			return text
		else
			return 'uwu'
		end
	end
end

return M
