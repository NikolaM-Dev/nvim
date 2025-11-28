---@class nkl.lib.ui
local M = {}

---Prompts the user for input
---
---Example:
---@usage
---```lua
---async_input(function()
---		local name = input({ prompt = 'What\'s your name?' })
---		print('You name is', name)
---		local age = input({ prompt = 'What\'s your age?' })
---		print('You age is', age)
---end)
---```
---
---@param opts? vim.ui.input.Opts
---@return string|nil value `string` or `nil` if the input is aborted
function M.input(opts)
	local wrapped_input = function(...)
		local co = coroutine.running()
		if not co then
			error('wrap_cb must be used inside a coroutine')
		end

		vim.ui.input(..., function(input)
			coroutine.resume(co, input)
		end)

		return coroutine.yield()
	end

	return wrapped_input(opts)
end

M.async_input = coroutine.wrap

return M
