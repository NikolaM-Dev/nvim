---@class NDate
local NDate = {}

local DAY_IN_SECONDS = 86400

---Get the current date in the format of YYYY-MM-DD
---@return string|osdate
function NDate.today()
	return os.date('%Y-%m-%d')
end

---Get the date of yesterday in the format of YYYY-MM-DD
---@return string|osdate
function NDate.yesterday()
	return os.date('%Y-%m-%d', os.time() - DAY_IN_SECONDS)
end

---Get the date of yesterday in the format of YYYY-MM-DD
---@return string|osdate
function NDate.tomorrow()
	return os.date('%Y-%m-%d', os.time() + DAY_IN_SECONDS)
end

return NDate
