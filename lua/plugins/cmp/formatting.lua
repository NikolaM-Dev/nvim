local M = {}

local kind_icons = {
	Class = '',
	Color = '',
	Constant = '',
	Constructor = '󰆧',
	Enum = '',
	EnumMember = '',
	Event = '',
	Field = '',
	File = '󰈙',
	Folder = '󰝰',
	Function = '',
	Interface = '',
	Keyword = '󰉨',
	Method = '',
	Module = '󰅩',
	Null = '󰟢',
	Operator = '󰆖',
	Property = '',
	Reference = '',
	Snippet = '󰃐',
	Struct = '',
	Text = '',
	TypeParameter = '󰊄',
	Unit = '',
	Value = '',
	Variable = '',
}

function M.format(entry, vim_item)
	if vim_item.kind == 'Color' and entry.completion_item.documentation then
		local _, _, r, g, b =
			---@diagnostic disable-next-line: param-type-mismatch
			string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')

		if r and g and b then
			local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
			local group = 'Tw_' .. color

			if vim.api.nvim_call_function('hlID', { group }) < 1 then
				vim.api.nvim_command('highlight' .. ' ' .. group .. ' ' .. 'guifg=#' .. color)
			end

			vim_item.kind = '󱓻󰝤󰝤󰝤󰝤󰝤󰝤󰝤󱓻'
			vim_item.kind_hl_group = group

			return vim_item
		end
	end

	vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)

	return vim_item
end

return M
