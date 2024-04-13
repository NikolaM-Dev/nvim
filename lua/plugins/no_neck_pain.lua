local is_markdown_ft = require('utils').is_markdown_ft

---@type boolean
local is_active = false

local function on_enable_zen_mode()
	if not vim.fn.executable('alacritty') then
		return
	end

	local cmd = 'alacritty msg config -w %s font.offset.y=6 font.size=13'
	local win_id = vim.fn.expand('$ALACRITTY_WINDOW_ID')

	vim.fn.system(cmd:format(win_id))
	vim.cmd('redraw')
end

local function on_disable_zen_mode()
	if not vim.fn.executable('alacritty') then
		return
	end

	local cmd = 'alacritty msg config -w %s --reset'
	local win_id = vim.fn.expand('$ALACRITTY_WINDOW_ID')

	vim.fn.system(cmd:format(win_id))
	vim.cmd('redraw')
end

local function toggle_zen_mode()
	vim.cmd('NoNeckPain')

	is_active = not is_active

	local is_second_brain_md_path = vim.fn.fnamemodify(vim.fn.getcwd(), ':p')
		== os.getenv('HOME') .. '/Documents/second-brain.md/'
	local is_available_to_zen_mode_features = is_markdown_ft() or is_second_brain_md_path

	if is_active and is_available_to_zen_mode_features then
		on_enable_zen_mode()
	else
		on_disable_zen_mode()
	end
end

return {
	'shortcuts/no-neck-pain.nvim',
	enabled = true,
	keys = {
		{
			'<leader>zm',
			function()
				toggle_zen_mode()
			end,
			desc = 'Toggle [Z]en [M]ode',
		},
	},
	config = function()
		require('no-neck-pain').setup()
	end,
}
