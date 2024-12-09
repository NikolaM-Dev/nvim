---@class NDate
local NDate = {}


---Get the current date in the format of YYYY-MM-DD
---@return string|osdate
function NDate.today()
	return os.date('%Y-%m-%d')
end
return NDate
