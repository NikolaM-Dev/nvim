---@module 'lazy.types'
---@type LazySpec
return {
	'redoxahmii/react-extract.nvim',
	desc = 'Neovim plugin for extracting jsx into React component',
	enabled = true,

	keys = {
		{
			'<leader>re',
			function()
				require('react-extract').extract_to_new_file()
			end,
			mode = { 'v' },
		},
		{
			'<leader>rc',
			function()
				require('react-extract').extract_to_current_file()
			end,
			mode = { 'v' },
		},
	},

	config = function()
		require('react-extract').setup({
			ts_type_property_template = '[INDENT][PROPERTY]: unknown\n',
			ts_template_before = 'type [COMPONENT_NAME]Props = {\n[TYPE_PROPERTIES]}\n[EMPTY_LINE]\n'
				.. 'export function [COMPONENT_NAME]'
				.. '([PROPERTIES]: [COMPONENT_NAME]Props): React.JSX.Element {\n'
				.. '[INDENT]return (\n',
			ts_template_after = '[INDENT])\n}',
		})
	end,
}
