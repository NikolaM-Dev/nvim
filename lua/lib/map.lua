---@class Map
local Map = {}

---@private
function Map:new()
	local map = {}
	self.__index = self

	return setmetatable(map, self)
end

local new_map = Map:new()
---@class MapCmdOpts
---@field delay_cmd? boolean defaults to false

---Constructs a command string based on the provided `cmd` and options.
---@param cmd The command to be executed.
---@param opts? MapCmdOpts table containing options for the command.
--- The `delay_cmd` option determines whether the command is delayed (default is `false`).
--- If `delay_cmd` is `true`, returns the command prefixed with a colon `:`.
--- Otherwise, returns the command wrapped with `<cmd>` and `<cr>`.
---@return string constructed command string based on the options provided.
function Map:cmd(cmd, opts)
	opts = opts or { delay_cmd = false }

	if opts.delay_cmd then
		return ':' .. cmd
	end

	return '<cmd>' .. cmd .. '<cr>'
end

return new_map
