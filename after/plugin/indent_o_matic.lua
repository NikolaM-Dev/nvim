local status_ok, ident_o_magic = pcall(require, 'ident-o-magic')
if not status_ok then
	return
end

ident_o_magic.setup({
	-- The values indicated here are the defaults

	-- Number of lines without indentation before giving up (use -1 for infinite)
	max_lines = 2048,

	-- Space indentations that should be detected
	standard_widths = { 2, 4, 8 },

	-- Skip multi-line comments and strings (more accurate detection but less performant)
	skip_multiline = true,

	filetype_typescript = { standard_widths = { 2 } },
	filetype_typescriptreact = { standard_widths = { 2 } },

	filetype_javascript = { standard_widths = { 2 } },
	filetype_javascriptreact = { standard_widths = { 2 } },

	-- Don't detect 8 spaces indentations inside files without a filetype
	filetype_ = { standard_widths = { 2, 4 } },
})
