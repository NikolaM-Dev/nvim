vim.opt.listchars = {
	-- eol = '¬',
	extends = '»',
	lead = ' ',
	nbsp = '␣',
	precedes = '«',
	space = ' ',
	tab = '  ', -- │
	trail = '·',
}

vim.opt.fillchars = {
	diff = '░', -- ╱
	eob = ' ',
	fold = ' ',
	foldclose = ' ', -- '',
	foldopen = '󰇘',
	foldsep = ' ',
}

vim.o.autoread = true -- Automatically read the file when changed outside of neovim
vim.o.backup = false -- Create backup files
vim.o.cursorline = true -- Highlight the text line of the cursor
vim.o.ignorecase = true -- Ignore case in search patterns
vim.o.inccommand = 'split' -- Shows the effects of a command incrementally using an split
vim.o.laststatus = 3 -- Always and ONLY the last window a status line
vim.o.linebreak = true -- Wrap long lines at characters, not in the middle of a word
vim.o.list = true -- Useful to see the difference between tabs and spaces and for trailing blanks
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative numbers
vim.o.showmode = false -- Removes the text indicating the mode
vim.o.showtabline = 0 -- Remove tab page label
vim.o.signcolumn = 'auto:2-4' -- Always show the sign column, otherwise it would shift the text each time
vim.o.smartcase = true -- difference between lower and upper case letters
vim.o.smartindent = true -- Do smart autoindenting when starting a new line.
vim.o.splitbelow = true -- Split window below
vim.o.splitright = true -- Split window right
vim.o.swapfile = false -- Creates a swapfile
vim.o.termguicolors = true -- True color support
vim.o.undodir = vim.fn.stdpath('data') .. '/nvim/undodir' -- Undodir path
vim.o.undofile = true -- Automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read.
vim.o.winbar = '%=%m %t' -- The window bar is a bar that's shown at the top of every window with it enabled
vim.o.winborder = 'rounded' -- Defines the default border style of floating windows
vim.o.wrap = false -- Wrap lines

vim.schedule(function()
	vim.o.clipboard = 'unnamedplus' -- use system clipboard
end)

vim.g.clipboard = {
	name = 'xsel',
	copy = {
		['+'] = 'xsel --nodetach -i -b',
		['*'] = 'xsel --nodetach -i -p',
	},
	paste = {
		['+'] = 'xsel -o -b',
		['*'] = 'xsel -o -b',
	},
	cache_enabled = 1,
}

do
	vim.o.foldmethod = 'expr'
	vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

	vim.api.nvim_create_autocmd('LspAttach', {
		desc = 'User: Set LSP folding if client supports it',
		callback = function(ctx)
			local client = assert(vim.lsp.get_client_by_id(ctx.data.client_id))
			if client:supports_method('textDocument/foldingRange') then
				local win = vim.api.nvim_get_current_win()
				vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
			end
		end,
	})
end

vim.filetype.add({
	filename = {
		['launch.json'] = 'jsonc',
		['tasks.json'] = 'jsonc',
	},
	pattern = {
		['[jt]sconfig.*.json'] = 'jsonc',
	},
})
