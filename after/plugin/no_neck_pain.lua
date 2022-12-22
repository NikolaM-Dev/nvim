local status_ok, no_neck_pain = pcall(require, 'no-neck-pain')
if not status_ok then
	return
end

local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local noremap = keymap.noremap
local opts = keymap.new_opts

local bufferOptions = {
	-- When `false`, the buffer won't be created.
	enabled = true,
	-- Hexadecimal color code to override the current background color of the buffer. (e.g. #24273A)
	backgroundColor = nil,
	-- buffer-scoped options: any `vim.bo` options is accepted here.
	bo = {
		filetype = 'no-neck-pain',
		buftype = 'nofile',
		bufhidden = 'hide',
		modifiable = false,
		buflisted = false,
		swapfile = false,
	},
	-- window-scoped options: any `vim.wo` options is accepted here.
	wo = {
		cursorline = false,
		cursorcolumn = true,
		number = false,
		relativenumber = false,
		foldenable = false,
		list = false,
	},
}

no_neck_pain.setup({
	-- The width of the focused buffer when enabling NNP.
	-- If the available window size is less than `width`, the buffer will take the whole screen.
	width = 100,
	-- Prints useful logs about what event are triggered, and reasons actions are executed.
	debug = false,
	-- Disables NNP if the last valid buffer in the list has been closed.
	disableOnLastBuffer = false,
	-- When `true`, disabling NNP kills every split/vsplit buffers except the main NNP buffer.
	killAllBuffersOnDisable = false,
	--- Common options that are set to both buffers, for option scoped to the `left` and/or `right` buffer, see `buffers.left` and `buffers.right`.
	--- See |NoNeckPain.bufferOptions|.
	buffers = {
		-- When `true`, the side buffers will be named `no-neck-pain-left` and `no-neck-pain-right` respectively.
		setNames = false,
		-- Hexadecimal color code to override the current background color of the buffer. (e.g. #24273A)
		backgroundColor = nil,
		-- buffer-scoped options: any `vim.bo` options is accepted here.
		bo = {
			filetype = 'no-neck-pain',
			buftype = 'nofile',
			bufhidden = 'hide',
			modifiable = false,
			buflisted = false,
			swapfile = false,
		},
		-- window-scoped options: any `vim.wo` options is accepted here.
		wo = {
			cursorline = false,
			cursorcolumn = true,
			number = false,
			relativenumber = false,
			foldenable = false,
			list = false,
		},
		--- Options applied to the `left` buffer, the options defined here overrides the ones at the root of the `buffers` level.
		--- See |NoNeckPain.bufferOptions|.
		left = bufferOptions,
		--- Options applied to the `right` buffer, the options defined here overrides the ones at the root of the `buffers` level.
		--- See |NoNeckPain.bufferOptions|.
		right = bufferOptions,
	},
	-- lists supported integrations that might clash with `no-neck-pain.nvim`'s behavior
	integrations = {
		-- https://github.com/nvim-tree/nvim-tree.lua
		nvimTree = {
			-- the position of the tree, can be `left` or `right``
			position = 'left',
		},
	},
})

nmap({ '<leader>zm', cmd('NoNeckPain'), opts(noremap) })
