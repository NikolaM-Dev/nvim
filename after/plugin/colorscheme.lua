local colorscheme = 'tokyonight'

local status_ok, tokyonight = pcall(require, colorscheme)
if not status_ok then
	return
end

tokyonight.setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = 'storm', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	light_style = 'day', -- The theme is used when the background is set to light
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = { bold = true },
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = 'dark', -- style for sidebars, see below
		floats = 'dark', -- style for floating windows
	},
	sidebars = { 'help', 'packer', 'qf', 'spectre_panel' }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = true, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	---@diagnostic disable-next-line: unused-local
	on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param hl Highlights
	---@param c ColorScheme
	---@diagnostic disable: undefined-field
	on_highlights = function(hl, c)
		hl.TelescopeBorder = { fg = c.comment }
	end,
})

local ok, _ = pcall(vim.api.nvim_command, 'colorscheme ' .. colorscheme)
if not ok then
	vim.notify('colorscheme ' .. colorscheme .. ' not found!')
	return
end
