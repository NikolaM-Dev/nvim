-- FIX: Change setup implementation
return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			---@type LazySpec[]
			{
				{
					enabled = false,
					'jackieaskins/cmp-emmet',
					build = 'npm run release',
				},
				'nvim-treesitter/nvim-treesitter',
			},
		},
		config = function()
			local cmp = require('cmp')
			local types = require('cmp.types')

			cmp.setup({
				completion = { completeopt = 'menu,menuone,noinsert' },
				snippet = {
					expand = function(args)
						if package.loaded['luasnip'] then
							require('luasnip').lsp_expand(args.body)
						else
							error('snippet engine is not configured.')
						end
					end,
				},
				---@diagnostic disable-next-line: missing-fields
				performance = { debounce = 20, fetching_timeout = 284, throttle = 20 },
				mapping = cmp.mapping.preset.insert({
					['<C-c>'] = cmp.mapping.abort(),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
					['<CR>'] = { i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }) },
					['<C-Space>'] = { i = cmp.mapping.complete() },
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-j>'] = {
						i = function()
							if cmp.visible() then
								cmp.select_next_item({ behavior = types.cmp.SelectBehavior.Insert })
							else
								cmp.complete()
							end
						end,
					},
					['<C-k>'] = {
						i = function()
							if cmp.visible() then
								cmp.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert })
							else
								cmp.complete()
							end
						end,
					},
				}),
				sources = cmp.config.sources({
					{ name = 'copilot' },
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lua' },
					{ name = 'luasnip' },
					{ name = 'emoji' },
					{ name = 'emmet' },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'buffer' },
					{ name = 'path' },
					{ name = 'calc' },
					{
						max_item_count = 10,
						name = 'rg',
						option = {
							additional_arguments = '--glob=\'!excalidraw/**\'',
						},
					},
				}),
				---@diagnostic disable-next-line: missing-fields
				formatting = { format = require('plugins.cmp.formatting').format },
				window = {
					completion = {
						border = 'rounded',
						scrollbar = false,
						winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
					},
					documentation = {
						border = 'rounded',
						winhighlight = 'FloatBorder:FloatBorder',
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
					{ name = 'rg', max_item_count = 10, option = { debounce = 42 } },
					{ name = 'buffer' },
				}),
			})
		end,
	},
	{
		'hrsh7th/cmp-cmdline',
		event = 'CmdlineEnter',
		dependencies = { 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path' },
		config = function()
			local cmp = require('cmp')

			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer', max_item_count = 10, option = { indexing_interval = 284 } },
					{ name = 'rg', max_item_count = 10, option = { debounce = 42 } },
				},
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline({
					['<CR>'] = { c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }) },
				}),
				sources = cmp.config.sources({
					{ name = 'path' },
					{ name = 'cmdline', max_item_count = 10 },
				}),
			})
		end,
	},
	{ 'hrsh7th/cmp-buffer', event = 'InsertEnter', dependencies = 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-calc', event = 'InsertEnter', dependencies = 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-nvim-lsp', event = 'LspAttach', dependencies = { 'hrsh7th/nvim-cmp', 'L3MON4D3/LuaSnip' } },
	{ 'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter', dependencies = 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-nvim-lua', event = 'InsertEnter', dependencies = 'hrsh7th/nvim-cmp', ft = 'lua' },
	{ 'hrsh7th/cmp-path', event = 'InsertEnter', dependencies = 'hrsh7th/nvim-cmp' },
	{ 'lukas-reineke/cmp-rg', event = 'InsertEnter', dependencies = 'hrsh7th/nvim-cmp' },
	{ 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter', dependencies = { 'hrsh7th/nvim-cmp', 'L3MON4D3/LuaSnip' } },
	{ 'hrsh7th/cmp-emoji', event = 'InsertEnter', dependencies = 'hrsh7th/nvim-cmp' },
	{
		'zbirenbaum/copilot-cmp',
		enabled = false,

		event = 'InsertEnter',
		dependencies = { 'zbirenbaum/copilot.lua' },
		config = function()
			require('copilot_cmp').setup()
		end,
	},
}
