---@class nkl.lib.url
local M = {}

---Properly encode a URL component according to RFC 3986.
---@param payload string
---@return string encoded_payload
function M.encode(payload)
	return (
		string.gsub(payload, '([^A-Za-z0-9_.~-])', function(c)
			return string.format('%%%02X', string.byte(c))
		end)
	)
end

---Decode a percent-encoded URL component.
---@param payload string
---@return string decoded_payload
function M.decode(payload)
	return (
		string.gsub(payload, '%%([0-9A-Fa-f][0-9A-Fa-f])', function(hex)
			return string.char(tonumber(hex, 16))
		end)
	)
end

return M
