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
		{ 'gb', '<cmd>Obsidian backlinks<cr>', desc = 'Obsidian [G]o to [B]acklinks' },
		{ 'gl', '<cmd>Obsidian links<cr>', desc = 'Obsidian [G]o to [L]inks' },
	},
	---@module 'obsidian'
	---@param opts obsidian.config.ClientOpts
	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}
