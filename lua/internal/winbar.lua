local exclude_buffer = {
	dashboard = true,
	telescope = true,
	terminal = true,
}

local function get_file_name()
	local ok, devicons = pcall(require, 'nvim-web-devicons')
	local f_icon = ''
	local f_hl = ''
	if ok then
		f_icon, f_hl = devicons.get_icon_by_filetype(vim.bo.filetype)
	end
	-- if filetype doesn't match devicon will set f_icon to nil so add a patch
	f_icon = f_icon == nil and '' or (f_icon .. ' ') -- No icon no space after separator
	f_hl = f_hl == nil and '' or f_hl
	return '%=%m %#' .. f_hl .. '#' .. f_icon .. '%*' .. vim.fn.expand('%:f') .. '%*'
end

local function config_winbar()
	if exclude_buffer[vim.bo.filetype] then
		return
	end

	vim.wo.winbar = get_file_name()
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'CursorMoved', 'User LspsagaUpdateSymbol' }, {
	group = _G.nikola_group,
	pattern = '*',
	callback = function()
		if vim.fn.winheight(0) > 1 then
			config_winbar()
		end
	end,
})
