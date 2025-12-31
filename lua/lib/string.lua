---@class nkl.lib.string
local M = {}

---Trim whitespace from both ends of a string.
---@param payload? string
---@return string
function M.trim(payload)
	if payload == nil then
		return ''
	end

	return payload:match('^%s*(.-)%s*$')
end

---Check whether a value is nil, empty, or only whitespace.
---@param payload? string
---@return boolean
function M.is_empty(payload)
	if payload == nil then
		return true
	end

	-- if there is any non-space character, then it's not blank
	return payload:match('%S') == nil
end

---Change the case of the payload into Title Case using the selected style
---@param payload string|nil
---@param style? 'new_york_times' | 'default'
---@return string
function M.title_case(payload, style)
	if M.is_empty(payload) then
		return ''
	end

	---Change special characters by standard ones
	---@cast payload string
	payload = M.trim(payload)
	payload:gsub('‘', '\''):gsub('’', '\''):gsub('“', '"'):gsub('”', '"')

	local STYLES = {
		new_york_times = {
			['and'] = 'and',
			['for'] = 'for',
			['if'] = 'if',
			['in'] = 'in',
			['or'] = 'or',
			['v.'] = 'v.',
			['vs.'] = 'vs.',
			['a'] = 'a',
			['an'] = 'an',
			['as'] = 'as',
			['at'] = 'at',
			['but'] = 'but',
			['by'] = 'by',
			['en'] = 'en',
			['nor'] = 'nor',
			['of'] = 'of',
			['on'] = 'on',
			['the'] = 'the',
			['to'] = 'to',
			['via'] = 'via',
		},
	}

	local special_words = {}
	local f = io.open(vim.fn.getcwd() .. '/special_words.json', 'r')
	if f then
		local data = f:read('*a')
		f:close()
		local ok, json = pcall(vim.json.decode, data, { luanil = { object = true } })
		if ok then
			special_words = vim.tbl_deep_extend('force', special_words, json or {})
		end
	end

	local selected_style = STYLES[style] or STYLES['new_york_times']
	local words = {}
	for word in payload:gmatch('%S+') do
		table.insert(words, word:lower())
	end

	local result = {}
	for i, word in ipairs(words) do
		if special_words[word] then
			table.insert(result, special_words[word])
		elseif i == 1 or i == #words then
			table.insert(result, word:sub(1, 1):upper() .. word:sub(2))
		elseif selected_style[word] then
			table.insert(result, selected_style[word])
		else
			table.insert(result, word:sub(1, 1):upper() .. word:sub(2))
		end
	end

	return table.concat(result, ' ')
end

return M
