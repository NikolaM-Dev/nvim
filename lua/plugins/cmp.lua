return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-path',
		'jalvesaq/cmp-nvim-r',
		'saadparwaiz1/cmp_luasnip',
		'max397574/cmp-greek',
		'hrsh7th/cmp-emoji',
	},

	config = function()
		local check_backspace = function()
			local col = vim.fn.col('.') - 1
			return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
		end

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
		end

		local kind_icons = {
			Text = '',
			Method = 'm',
			Function = '',
			Constructor = '',
			Field = '',
			Variable = '',
			Class = '',
			Interface = '',
			Module = '',
			Property = '',
			Unit = '',
			Value = '',
			Enum = '',
			Keyword = '',
			Snippet = '',
			Color = '',
			File = '',
			Reference = '',
			Folder = '',
			EnumMember = '',
			Constant = '',
			Struct = '',
			Event = '',
			Operator = '',
			TypeParameter = '',
		}

		-- Setup nvim-cmp.
		local cmp = require('cmp')
		local luasnip = require('luasnip')

		cmp.setup({
			enabled = function()
				-- disable autocompletion in prompt (wasn't playing well with telescope)
				local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
				if buftype == 'prompt' then
					return false
				end

				local context = require('cmp.config.context')
				-- disable autocompletion in comments
				return not context.in_treesitter_capture('comment') and not context.in_syntax_group('Comment')
			end,

			completion = {
				completeopt = 'menu,menuone,noselect',
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					elseif check_backspace() then
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
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp', max_item_count = 10 },
				{ name = 'nvim_lua' },
				{
					name = 'buffer',
					-- get words from visible buffers
					option = {
						keyword_length = 5,
						max_item_count = 3,
						get_bufnrs = function()
							local bufs = {}
							for _, win in ipairs(vim.api.nvim_list_wins()) do
								bufs[vim.api.nvim_win_get_buf(win)] = true
							end
							return vim.tbl_keys(bufs)
						end,
					},
				},
				{ name = 'cmp_nvim_r' },
				{ name = 'luasnip', keyword_length = 3, max_item_count = 3 },
				{ name = 'path' },
				{ name = 'greek' },
				{ name = 'emoji' },
			}),
			formatting = {
				fields = { 'kind', 'abbr', 'menu' },
				format = function(entry, vim_item)
					vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
					vim_item.menu = ({
						nvim_lsp = '[LSP]',
						luasnip = '[Snippet]',
						buffer = '[Buffer]',
						path = '[Path]',
						cmp_nvim_r = '[R]',
						nvim_lua = '[Lua]',
						greek = '[Greek]',
						emoji = '[Emoji]',
					})[entry.source.name]
					return vim_item
				end,
			},
			window = {
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = {
					hl_group = 'LspCodeLens',
				},
			},
		})
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' },
			},
		})
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' },
				{ name = 'cmdline' },
			}),
		})
	end,
}
