local status_ok, autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
	return
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

autopairs.setup({
	-- NOTE: Read docs about this
	-- ts_config = {
	-- 	lua = { 'string', 'source' },
	-- 	javascript = { 'string', 'template_string' },
	-- 	java = false,
	-- },
	fast_wrap = {
		chars = { '{', '[', '(', '"', '\'' },
		check_comma = true,
		end_key = '$',
		highlight_grey = 'Comment',
		highlight = 'Search',
		keys = 'qwertyuiopzxcvbnmasdfghjkl',
		map = '<M-e>',
		pattern = [=[[%'%"%)%>%]%)%}%,]]=],
	},
	disable_filetype = { 'TelescopePrompt' },
	break_undo = true, -- switch for basic rule break undo sequence
	check_ts = false,
	disable_in_macro = false, -- disable when recording or executing a macro
	disable_in_visualblock = false, -- disable when insert after visual block mode
	enable_abbr = false, -- trigger abbreviation
	enable_afterquote = true, -- add bracket pairs after quote
	enable_bracket_in_quote = true, --
	enable_check_bracket_line = true, --- check bracket in same line
	enable_moveright = true,
	ignored_next_char = [=[[%w%%%'%[%"%.]]=],
	map_bs = true, -- map the <BS> key
	map_c_h = false, -- Map the <C-h> key to delete a pair
	map_cr = true,
	map_c_w = false, -- map <c-w> to delete a pair if possible
})

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
	return
end

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
