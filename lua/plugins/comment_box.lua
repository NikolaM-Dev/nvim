---@module 'lazy.types'
---@type LazySpec
return {
	'LudoPinelli/comment-box.nvim',
	desc = '✨ Clarify and beautify your comments and plain text files using boxes and lines. ',
	enabled = true,

	cmd = {
		'CBccbox',
		'CBline',
		'CBllbox14',
		'CBllline',
	},

	keys = {
		{ mode = { 'n' }, '<Leader>cl', '<Cmd>CBline<CR>' },
		{ mode = { 'n', 'v' }, '<Leader>cb', '<Cmd>CBccbox<CR>' },
		{ mode = { 'n', 'v' }, '<Leader>cd', '<Cmd>CBd<CR>' },
		{ mode = { 'n', 'v' }, '<Leader>cm', '<Cmd>CBllbox14<CR>' },
		{ mode = { 'n', 'v' }, '<Leader>ct', '<Cmd>CBllline<CR>' },
	},

	config = true,
}
