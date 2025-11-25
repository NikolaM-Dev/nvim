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
return M
