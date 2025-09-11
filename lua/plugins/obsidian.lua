---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'obsidian-nvim/obsidian.nvim',
	desc = 'Obsidian 🤝 Neovim',
	enabled = true,

	ft = 'markdown',

	cmd = { 'Obsidian' },

	keys = {
		{ '<leader>o', '<cmd>Obsidian<cr>', desc = '[O]bsidian' },
	},

	---@module 'obsidian'
	---@param opts obsidian.config.ClientOpts
	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}
