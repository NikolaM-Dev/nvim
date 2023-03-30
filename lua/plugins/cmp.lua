return {
	'hrsh7th/nvim-cmp',
	event = 'VimEnter',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-calc',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-path',
		'lukas-reineke/cmp-rg',
		'saadparwaiz1/cmp_luasnip',
		{ 'jackieaskins/cmp-emmet', build = 'npm run release' },
	},
	config = function()
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

		local cmp = require('cmp')
		local luasnip = require('luasnip')

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = 'menu,menuone,noselect' },
			performance = { debounce = 20, throttle = 20, fetching_timeout = 284 },
			mapping = cmp.mapping.preset.insert({
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
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
				['<C-c>'] = cmp.mapping.abort(),
				['<C-d>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete({}),
				['<C-u>'] = cmp.mapping.scroll_docs(-4),
				['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp', max_item_count = 10 },
				{ name = 'nvim_lua' },
				{ name = 'luasnip', max_item_count = 3 },
				{ name = 'emmet' },
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'buffer' },
				{ name = 'path' },
				{ name = 'calc' },
			}),
			formatting = {
				format = function(_, vim_item)
					vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
					return vim_item
				end,
			},
			window = {
				documentation = { border = 'rounded' },
				completion = {
					border = 'rounded',
					scrollbar = false,
					winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
				},
			},
			experimental = {
				ghost_text = {
					hl_group = 'LspCodeLens',
				},
			},
		})

		cmp.setup.filetype('gitcommit', {
			sources = cmp.config.sources({
				{ name = 'luasnip' },
				{ name = 'buffer' },
				{ name = 'rg' },
			}),
		})

		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer', max_item_count = 10 },
				{ name = 'rg', max_item_count = 10 },
			},
		})

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' },
				{ name = 'cmdline', max_item_count = 10 },
			}),
		})
	end,
}
