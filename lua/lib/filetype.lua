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

---Verify if a file exists in the given filepath
---@param filepath string
function NFiletype.file_exists(filepath)
	local file = io.open(filepath, 'r')

	if not file then
		return false
	end

	file:close()

	return true
end

---Verify if a file exists in the given filepath using vim.uv
---@param filepath string
function NFiletype.file_exists_uv(filepath)
	local stat = vim.uv.fs_stat(filepath)

	return stat and stat.type == 'file'
end

return NFiletype
