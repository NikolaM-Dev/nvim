---@module 'lazy.types'
---@type LazySpec
return {
	'folke/sidekick.nvim',
	desc = 'Your Neovim AI sidekick',
	enabled = true,

	keys = {
		-- stylua: ignore start
		{ '<C-.>', function() require('sidekick.cli').toggle({ name = 'opencode', focus = true }) end, desc = 'Sidekick Toggle', mode = { 'n', 't', 'i', 'x' } },
		{ '<leader>ad', function() require('sidekick.cli').close() end, desc = 'Detach a CLI Session' },
		{ '<leader>at', function() require('sidekick.cli').send({ msg = '{this}' }) end, mode = { 'x', 'n' }, desc = 'Send This' },
		{ '<leader>af', function() require('sidekick.cli').send({ msg = '{file}' }) end, desc = 'Send File' },
		{ '<leader>av', function() require('sidekick.cli').send({ msg = '{selection}' }) end, mode = { 'x' }, desc = 'Send Visual Selection' },
		{ '<leader>ap', function() require('sidekick.cli').prompt() end, mode = { 'n', 'x' }, desc = 'Sidekick Select Prompt' },
		-- stylua: ignore end
	},

	---@module 'sidekick'
	---@type sidekick.Config
	opts = {
		cli = {
			mux = {
				enabled = true,
			},
			win = {
				keys = {
					prompt = { '<M-p>', 'prompt', mode = 't', desc = 'insert prompt or context' },
				},
			},
		},
	},
}
