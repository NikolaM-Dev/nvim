local Table = require('lib.table')

---@class Filetype
local Filetype = {}

function Filetype:new()
	local filetype = {}
	self.__index = self

	return setmetatable(filetype, self)
end

function Filetype:is_reading_ft()
	local reading_filetypes = {
		'asciidoc',
		'markdown',
		'norg',
		'org',
		'text',
	}

	return Table:includes(reading_filetypes, vim.bo.filetype)
end

return Filetype:new()
