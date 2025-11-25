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
return M
