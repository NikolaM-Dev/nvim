-- Bleu Theme for Neovim
-- Author: bnema
-- Inspired by blue gradient wallpaper and comprehensive Blue theme system
-- Based on the Bleu color palette from ghostty, zellij, and starship themes

-- Clear existing colorscheme and set background
vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
	vim.cmd('syntax reset')
end

vim.g.colors_name = 'bleu'
vim.o.background = 'dark'

-- Bleu Color Palette - Updated to match VSCode Bleu theme for cleaner, more subtle appearance
local colors = {
	-- Core backgrounds (matching VSCode exactly)
	bg = '#050a14', -- Main background
	bg_alt = '#070c16', -- Secondary background (sidebar, borders)
	bg_float = '#0a1018', -- Floating windows, panels
	bg_highlight = '#0f1520', -- Line highlight, tab active

	-- Foreground colors
	fg = '#e8f4f8', -- Main text
	fg_alt = '#fefefe', -- Pure white for emphasis
	fg_dim = '#708090', -- Dimmed text for comments, inactive

	-- Primary colors (matching VSCode theme)
	primary = '#00d4ff', -- Bright cyan for keywords, links
	focus = '#5588cc', -- Blue for focus states, types
	selection = '#2d4a6b', -- Selection background
	border = '#2d4a6b', -- Borders, guides

	-- Syntax colors (refined to match VSCode)
	keyword = '#00d4ff', -- Keywords, control flow
	type = '#5588cc', -- Types, classes
	string = '#87ceeb', -- Strings, markup
	number = '#4a7ba7', -- Numbers, constants
	function_name = '#fefefe', -- Functions (bold white)
	operator = '#5588cc', -- Operators, delimiters

	-- Status colors
	error = '#ff6b8a', -- Errors
	warn = '#00d4ff', -- Warnings (cyan - matching VSCode UI)
	info = '#87ceeb', -- Info
	success = '#99FFE4', -- Success/added
	hint = '#708090', -- Hints

	-- Special colors
	cursor = '#5588cc', -- Cursor
	search = '#2d4a6b', -- Search matches
	search_current = '#5588cc', -- Current search match
	link = '#00d4ff', -- Links
	accent = '#00d4ff', -- Accent color for special characters
}

-- Helper function to set highlights
local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Editor highlights
hl('Normal', { fg = colors.fg, bg = colors.bg })
hl('NormalFloat', { fg = colors.fg, bg = colors.bg_float })
hl('FloatBorder', { fg = colors.border, bg = colors.bg_float })
hl('Cursor', { fg = colors.bg, bg = colors.cursor })
hl('CursorLine', { bg = colors.bg_highlight })
hl('CursorColumn', { bg = colors.bg_highlight })
hl('ColorColumn', { bg = colors.bg_highlight })
hl('LineNr', { fg = colors.border })
hl('CursorLineNr', { fg = colors.primary, bold = true })
hl('SignColumn', { fg = colors.border, bg = colors.bg })
hl('Folded', { fg = colors.fg_dim, bg = colors.bg_highlight })
hl('FoldColumn', { fg = colors.border, bg = colors.bg })

-- Selection and search
hl('Visual', { bg = colors.selection })
hl('VisualNOS', { bg = colors.selection })
hl('Search', { bg = colors.search })
hl('IncSearch', { fg = colors.bg, bg = colors.search_current })
hl('Substitute', { fg = colors.bg, bg = colors.error })

-- Split and window
hl('VertSplit', { fg = colors.bg_alt })
hl('WinSeparator', { fg = colors.bg_alt })
hl('StatusLine', { fg = colors.fg, bg = colors.bg_float })
hl('StatusLineNC', { fg = colors.fg_dim, bg = colors.bg_float })
hl('TabLine', { fg = colors.fg_dim, bg = colors.bg })
hl('TabLineFill', { bg = colors.bg })
hl('TabLineSel', { fg = colors.fg_alt, bg = colors.bg_highlight })

-- Popup menu
hl('Pmenu', { fg = colors.fg, bg = colors.bg_float })
hl('PmenuSel', { fg = colors.fg_alt, bg = colors.focus })
hl('PmenuSbar', { bg = colors.border })
hl('PmenuThumb', { bg = colors.primary })

-- Messages and command line
hl('ErrorMsg', { fg = colors.error })
hl('WarningMsg', { fg = colors.warn })
hl('ModeMsg', { fg = colors.primary })
hl('MoreMsg', { fg = colors.primary })
hl('Question', { fg = colors.primary })

-- Syntax highlighting
hl('Comment', { fg = colors.fg_dim, italic = true })
hl('Constant', { fg = colors.number })
hl('String', { fg = colors.string })
hl('Character', { fg = colors.string })
hl('Number', { fg = colors.number })
hl('Boolean', { fg = colors.keyword })
hl('Float', { fg = colors.number })

hl('Identifier', { fg = colors.fg })
hl('Function', { fg = colors.function_name, bold = true })
hl('Statement', { fg = colors.keyword })
hl('Conditional', { fg = colors.keyword })
hl('Repeat', { fg = colors.keyword })
hl('Label', { fg = colors.keyword })
hl('Operator', { fg = colors.operator })
hl('Keyword', { fg = colors.keyword, italic = true })
hl('Exception', { fg = colors.error })

hl('PreProc', { fg = colors.keyword })
hl('Include', { fg = colors.keyword })
hl('Define', { fg = colors.keyword })
hl('Macro', { fg = colors.warn })
hl('PreCondit', { fg = colors.keyword })

hl('Type', { fg = colors.type })
hl('StorageClass', { fg = colors.keyword })
hl('Structure', { fg = colors.type })
hl('Typedef', { fg = colors.type })

hl('Special', { fg = colors.warn })
hl('SpecialChar', { fg = colors.number })
hl('Tag', { fg = colors.keyword })
hl('Delimiter', { fg = colors.operator })
hl('SpecialComment', { fg = colors.hint, italic = true })
hl('Debug', { fg = colors.error })

-- Underlined and error
hl('Underlined', { fg = colors.link, underline = true })
hl('Error', { fg = colors.error })
hl('Todo', { fg = colors.warn, bg = colors.bg_highlight, bold = true })

-- Spell checking
hl('SpellBad', { fg = colors.error, undercurl = true })
hl('SpellCap', { fg = colors.warn, undercurl = true })
hl('SpellRare', { fg = colors.info, undercurl = true })
hl('SpellLocal', { fg = colors.hint, undercurl = true })

-- Diff
hl('DiffAdd', { fg = colors.success, bg = colors.bg_highlight })
hl('DiffChange', { fg = colors.warn, bg = colors.bg_highlight })
hl('DiffDelete', { fg = colors.error, bg = colors.bg_highlight })
hl('DiffText', { fg = colors.focus, bg = colors.selection })

-- LSP highlights
hl('LspReferenceText', { bg = colors.selection })
hl('LspReferenceRead', { bg = colors.selection })
hl('LspReferenceWrite', { bg = colors.selection })

-- Diagnostic highlights
hl('DiagnosticError', { fg = colors.error })
hl('DiagnosticWarn', { fg = colors.warn })
hl('DiagnosticInfo', { fg = colors.info })
hl('DiagnosticHint', { fg = colors.hint })

hl('DiagnosticSignError', { fg = colors.error, bg = colors.bg })
hl('DiagnosticSignWarn', { fg = colors.warn, bg = colors.bg })
hl('DiagnosticSignInfo', { fg = colors.info, bg = colors.bg })
hl('DiagnosticSignHint', { fg = colors.hint, bg = colors.bg })

hl('DiagnosticUnderlineError', { undercurl = true, sp = colors.error })
hl('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.warn })
hl('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.info })
hl('DiagnosticUnderlineHint', { undercurl = true, sp = colors.hint })

-- Tree-sitter highlights (modern syntax highlighting)
hl('@comment', { link = 'Comment' })
hl('@constant', { link = 'Constant' })
hl('@constant.builtin', { fg = colors.focus })
hl('@constant.macro', { link = 'Macro' })
hl('@string', { link = 'String' })
hl('@string.escape', { fg = colors.accent })
hl('@character', { link = 'Character' })
hl('@number', { link = 'Number' })
hl('@boolean', { link = 'Boolean' })
hl('@float', { link = 'Float' })

hl('@function', { link = 'Function' })
hl('@function.builtin', { fg = colors.type, bold = true })
hl('@function.macro', { link = 'Macro' })
hl('@parameter', { fg = colors.fg })
hl('@method', { link = 'Function' })
hl('@field', { fg = colors.fg })
hl('@property', { fg = colors.fg })
hl('@constructor', { fg = colors.type })

hl('@keyword', { link = 'Keyword' })
hl('@keyword.function', { fg = colors.keyword })
hl('@keyword.operator', { fg = colors.operator })
hl('@keyword.return', { fg = colors.keyword })
hl('@conditional', { link = 'Conditional' })
hl('@repeat', { link = 'Repeat' })
hl('@label', { link = 'Label' })
hl('@operator', { link = 'Operator' })
hl('@exception', { link = 'Exception' })

hl('@variable', { fg = colors.fg })
hl('@variable.builtin', { fg = colors.type })
hl('@type', { link = 'Type' })
hl('@type.builtin', { fg = colors.type })
hl('@type.definition', { link = 'Typedef' })
hl('@storageclass', { link = 'StorageClass' })
hl('@structure', { link = 'Structure' })
hl('@namespace', { fg = colors.type })
hl('@include', { link = 'Include' })
hl('@preproc', { link = 'PreProc' })
hl('@debug', { link = 'Debug' })
hl('@tag', { link = 'Tag' })

-- Git signs (gitsigns.nvim)
hl('GitSignsAdd', { fg = colors.success, bg = colors.bg })
hl('GitSignsChange', { fg = colors.warn, bg = colors.bg })
hl('GitSignsDelete', { fg = colors.error, bg = colors.bg })

-- Telescope (fuzzy finder)
hl('TelescopeNormal', { fg = colors.fg, bg = colors.bg_float })
hl('TelescopeBorder', { fg = colors.border, bg = colors.bg_float })
hl('TelescopePromptNormal', { fg = colors.fg, bg = colors.bg_float })
hl('TelescopePromptBorder', { fg = colors.focus, bg = colors.bg_float })
hl('TelescopePromptTitle', { fg = colors.fg_alt, bg = colors.focus })
hl('TelescopePreviewTitle', { fg = colors.fg_alt, bg = colors.primary })
hl('TelescopeResultsTitle', { fg = colors.fg_alt, bg = colors.type })
hl('TelescopeSelection', { fg = colors.fg_alt, bg = colors.selection })
hl('TelescopeMatching', { fg = colors.primary, bold = true })

-- Neo-tree (file explorer)
hl('NeoTreeNormal', { fg = colors.fg, bg = colors.bg_alt })
hl('NeoTreeNormalNC', { fg = colors.fg, bg = colors.bg_alt })
hl('NeoTreeDirectoryName', { fg = colors.primary })
hl('NeoTreeDirectoryIcon', { fg = colors.primary })
hl('NeoTreeFileName', { fg = colors.fg })
hl('NeoTreeFileIcon', { fg = colors.type })
hl('NeoTreeGitModified', { fg = colors.warn })
hl('NeoTreeGitAdded', { fg = colors.success })
hl('NeoTreeGitDeleted', { fg = colors.error })
hl('NeoTreeGitIgnored', { fg = colors.fg_dim })

-- Which-key (keybinding helper)
hl('WhichKey', { fg = colors.primary })
hl('WhichKeyGroup', { fg = colors.type })
hl('WhichKeyDesc', { fg = colors.fg })
hl('WhichKeySeperator', { fg = colors.fg_dim })
hl('WhichKeyFloat', { bg = colors.bg_float })
hl('WhichKeyBorder', { fg = colors.border, bg = colors.bg_float })

-- Bufferline (tab line)
hl('BufferLineBackground', { fg = colors.fg_dim, bg = colors.bg })
hl('BufferLineBufferSelected', { fg = colors.fg_alt, bg = colors.bg_highlight, bold = true })
hl('BufferLineBufferVisible', { fg = colors.fg, bg = colors.bg })
hl('BufferLineCloseButton', { fg = colors.fg_dim, bg = colors.bg })
hl('BufferLineCloseButtonSelected', { fg = colors.error, bg = colors.bg_highlight })
hl('BufferLineCloseButtonVisible', { fg = colors.fg_dim, bg = colors.bg })
hl('BufferLineFill', { bg = colors.bg })
hl('BufferLineIndicatorSelected', { fg = colors.focus, bg = colors.bg_highlight })
hl('BufferLineModified', { fg = colors.warn, bg = colors.bg })
hl('BufferLineModifiedSelected', { fg = colors.warn, bg = colors.bg_highlight })
hl('BufferLineModifiedVisible', { fg = colors.warn, bg = colors.bg })
hl('BufferLineSeparator', { fg = colors.bg_alt, bg = colors.bg })
hl('BufferLineSeparatorSelected', { fg = colors.bg_alt, bg = colors.bg_highlight })
hl('BufferLineSeparatorVisible', { fg = colors.bg_alt, bg = colors.bg })
hl('BufferLineTab', { fg = colors.fg_dim, bg = colors.bg })
hl('BufferLineTabSelected', { fg = colors.fg_alt, bg = colors.bg_highlight })
hl('BufferLineTabClose', { fg = colors.error, bg = colors.bg })

-- Lualine (status line)
hl('LualineNormal', { fg = colors.fg, bg = colors.bg_float })
hl('LualineInsert', { fg = colors.bg, bg = colors.success })
hl('LualineVisual', { fg = colors.bg, bg = colors.warn })
hl('LualineReplace', { fg = colors.bg, bg = colors.error })
hl('LualineCommand', { fg = colors.bg, bg = colors.primary })

-- Indent blankline
hl('IndentBlanklineChar', { fg = colors.border })
hl('IndentBlanklineContextChar', { fg = colors.focus })

-- Additional LSP and completion groups
hl('LspInlayHint', { fg = colors.fg_dim, bg = colors.bg_highlight })
hl('LspCodeLens', { fg = colors.fg_dim })
hl('LspCodeLensSign', { fg = colors.fg_dim })

-- Completion menu (nvim-cmp)
hl('CmpItemKind', { fg = colors.type })
hl('CmpItemMenu', { fg = colors.fg_dim })
hl('CmpItemAbbrMatch', { fg = colors.primary, bold = true })
hl('CmpItemAbbrMatchFuzzy', { fg = colors.primary })

-- MatchParen - matching bracket highlighting
hl('MatchParen', { fg = colors.primary, bold = true })

-- Additional diagnostic virtual text
hl('DiagnosticVirtualTextError', { fg = colors.error, bg = colors.bg_highlight })
hl('DiagnosticVirtualTextWarn', { fg = colors.warn, bg = colors.bg_highlight })
hl('DiagnosticVirtualTextInfo', { fg = colors.info, bg = colors.bg_highlight })
hl('DiagnosticVirtualTextHint', { fg = colors.hint, bg = colors.bg_highlight })

-- Floating window
hl('FloatTitle', { fg = colors.fg_alt, bg = colors.focus })

-- Notify (notification plugin)
hl('NotifyBackground', { bg = colors.bg_float })
hl('NotifyERRORBorder', { fg = colors.error, bg = colors.bg_float })
hl('NotifyWARNBorder', { fg = colors.warn, bg = colors.bg_float })
hl('NotifyINFOBorder', { fg = colors.info, bg = colors.bg_float })
hl('NotifyDEBUGBorder', { fg = colors.hint, bg = colors.bg_float })
hl('NotifyTRACEBorder', { fg = colors.fg_dim, bg = colors.bg_float })
hl('NotifyERRORIcon', { fg = colors.error })
hl('NotifyWARNIcon', { fg = colors.warn })
hl('NotifyINFOIcon', { fg = colors.info })
hl('NotifyDEBUGIcon', { fg = colors.hint })
hl('NotifyTRACEIcon', { fg = colors.fg_dim })
hl('NotifyERRORTitle', { fg = colors.error })
hl('NotifyWARNTitle', { fg = colors.warn })
hl('NotifyINFOTitle', { fg = colors.info })
hl('NotifyDEBUGTitle', { fg = colors.hint })
hl('NotifyTRACETitle', { fg = colors.fg_dim })
