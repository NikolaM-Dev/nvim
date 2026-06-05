---@module 'lazy.types'
---@type LazySpec
return {
	'folke/sidekick.nvim',
	desc = 'Your Neovim AI sidekick',
	enabled = true,

	keys = {
		-- stylua: ignore start
		{ '<C-.>', function() require('sidekick.cli').toggle({ focus = true }) end, desc = 'Sidekick Toggle', mode = { 'n', 't', 'i', 'x' } },
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
				enabled = false,
			},
			prompts = {
				['high quality'] = 'Could you please review the following in terms of High Quality Code (correctness, design, and style) {file}',
				['polish'] = [[
Act as a professional editor. Polish the text in the file I going to share with you to make it fluent, natural, and professional.

Instructions:

- **Correct:** Fix all grammar, spelling, punctuation, and capitalization errors.
- **Improve Flow:** Enhance sentence clarity and conciseness. Use natural phrasing.
- **Preserve Content:** Do not add, remove, or change any facts, figures, names, or technical details. Keep the original meaning and emphasis.
- **Preserve Format:** Maintain all original formatting (markdown, lists, code blocks, etc.).
- **Handle Ambiguity:** If text is ambiguous and cannot be fixed without adding facts, mark it with `[AMBIGUOUS — needs clarification]`.
- **Suggest headings:** Based on the polished file suggest possible a possible heading (max 3)
]],
			},
			win = {
				-- layout = 'float',
				keys = {
					buffers = { '<M-n>', 'buffers', mode = 'nt', desc = 'open file picker' },
					files = { '<M-N>', 'files', mode = 'nt', desc = 'open file picker' },
					prompt = { '<M-p>', 'prompt', mode = 't', desc = 'insert prompt or context' },
					-- buffers = nil,
				},
			},
		},
	},

	---@param opts sidekick.Config
	config = function(_, opts)
		require('sidekick').setup(opts)

		-- vim.api.nvim_create_autocmd({ 'WinClosed', 'WinNew' }, {
		-- 	desc = 'Resize dap-ui when Sidekick window is opened or closed',
		-- 	group = nkl.augroup('sidekick_dapui_resize'),
		-- 	callback = function()
		-- 		local dapui_ok, dapui = pcall(require, 'dapui')
		-- 		local dap_ok, dap = pcall(require, 'dap')
		--
		-- 		if not dap_ok or not dapui_ok then
		-- 			return
		-- 		end
		--
		-- 		if dap.session() then
		-- 			vim.schedule(function()
		-- 				dapui.open({ reset = true })
		-- 			end)
		-- 		end
		-- 	end,
		-- })
	end,
}
