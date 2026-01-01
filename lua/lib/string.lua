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
		local leading = word:match('^([^%w%d]+)') or ''
		local rest = word:sub(#leading + 1)
		local punctuation = rest:match('[!%?%.%,]+$') or ''
		local core = punctuation ~= '' and rest:sub(1, #rest - #punctuation) or rest

		if core == '' then
			table.insert(result, word)
		else
			local formatted
			if special_words[core] then
				formatted = special_words[core]
			elseif i == 1 or i == #words then
				formatted = M.capitalize(core)
			elseif selected_style[core] then
				formatted = selected_style[core]
			else
				formatted = M.capitalize(core)
			end

			if punctuation ~= '' then
				formatted = formatted .. punctuation
			end

			formatted = leading .. formatted
			table.insert(result, formatted)
		end
	end

	return table.concat(result, ' ')
end

return M
