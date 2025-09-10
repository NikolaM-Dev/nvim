---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'junegunn/vim-easy-align',
	desc = 'A Vim alignment plugin',
	enabled = true,

	cmd = {
		'EasyAlign',
		'LiveEasyAlign',
	},

	keys = {
		{ 'ga', '<Plug>(LiveEasyAlign)', desc = 'Live Easy [A]lign', mode = { 'n', 'v', 'x' } },
	},
}
