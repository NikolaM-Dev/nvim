---@module 'lazy.types'
---@type LazySpec
return {
	'folke/noice.nvim',
	desc = 'Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.',
	enabled = true,

	event = 'VeryLazy',
	dependencies = { 'MunifTanjim/nui.nvim' },

	---@module 'noice'
	---@type NoiceConfig
	opts = {
		lsp = {
			override = {
				['cmp.entry.get_documentation'] = true,
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown'] = true,
			},
		},
		routes = {
			{
				filter = {
					event = 'msg_show',
					any = {
						{ find = '%d+L, %d+B' },
						{ find = '; after #%d+' },
						{ find = '; before #%d+' },
					},
				},
				view = 'mini',
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
		},
	},
}
