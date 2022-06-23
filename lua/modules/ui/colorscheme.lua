local colorscheme = 'tokyonight'
local global = vim.g

global.tokyonight_style = 'night'
global.tokyonight_transparent = true

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
	vim.notify('colorscheme ' .. colorscheme .. ' not found!')
	return
end
