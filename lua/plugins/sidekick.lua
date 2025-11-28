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

	---@param opts sidekick.Config
	config = function(_, opts)
		require('sidekick').setup(opts)

		vim.api.nvim_create_autocmd({ 'WinClosed', 'WinNew' }, {
			desc = 'Resize dap-ui when Sidekick window is opened or closed',
			group = nkl.augroup('sidekick_dapui_resize'),
			callback = function()
				local dapui_ok, dapui = pcall(require, 'dapui')
				local dap_ok, dap = pcall(require, 'dap')

				if not dap_ok or not dapui_ok then
					return
				end

				local has_debbug_session = #dap.sessions() > 0
				if has_debbug_session then
					vim.schedule(function()
						dapui.open({ reset = true })
					end)
				end
			end,
		})
	end,
}
