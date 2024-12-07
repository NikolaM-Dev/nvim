local table = require('lib.table')

---@class NFiletype
local NFiletype = {}

-- TODO: Add docs
function NFiletype.is_reading_ft()
	local reading_filetypes = {
		'asciidoc',
		'markdown',
		'norg',
		'org',
		'text',
	}

	return table.includes(reading_filetypes, vim.bo.filetype)
end

return NFiletype
