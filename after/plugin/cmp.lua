local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
	return
end

local function border(hl_name)
	return {
		{ '╭', hl_name },
		{ '─', hl_name },
		{ '╮', hl_name },
		{ '│', hl_name },
		{ '╯', hl_name },
		{ '─', hl_name },
		{ '╰', hl_name },
		{ '│', hl_name },
	}
end

local cmp_window = require('cmp.utils.window')

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
	local info = self:info_()
	info.scrollable = false
	return info
end

local has_words_before = function()
	---@diagnostic disable-next-line: deprecated
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local kind_icons = {
	Class = '',
	Color = '',
	Constant = '',
	Constructor = '',
	Enum = '',
	EnumMember = '',
	Event = '',
	Field = '',
	File = '',
	Folder = 'ﱮ',
	Function = '',
	Interface = '',
	Keyword = '',
	Method = '',
	Module = '',
	Operator = '',
	Property = '',
	Reference = '',
	Snippet = '',
	Struct = '',
	Text = '',
	TypeParameter = '',
	Unit = '',
	Value = '',
	Variable = '',
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = {
			border = border('CmpBorder'),
			winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
		},
		documentation = {
			border = border('CmpDocBorder'),
		},
	},
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			return vim_item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-c>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'calc' },
	}),
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'rg' },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
})
