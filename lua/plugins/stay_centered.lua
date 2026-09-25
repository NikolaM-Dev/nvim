---@module 'lazy.types'
---@type LazySpec
return {
	'arnamak/stay-centered.nvim',
	desc = 'A neovim plugin to keep your cursor at the center of the screen',
	enabled = true,
	lazy = false,

	keys = {
		{
			'ttsc',
			function()
				local opts = { title = 'Stay Centered' }
				local stay_centered = require('stay-centered')

				stay_centered.toggle()

				if stay_centered.cfg.enabled then
					Snacks.notify.info('Stay Centered enabled', opts)
				else
					Snacks.notify.warn('Stay Centered disabled', opts)
				end
			end,
			desc = 'Toggle Stay Centered',
		},
	},

	---@type table
	opts = {
		enabled = false,
	},

	config = function(_, opts)
		require('stay-centered').setup(opts)

		---Enable stay-centered when inside the second brain, disable elsewhere.
		---Checks both the cwd and the current buffer path so opening a note
		---via absolute path from another cwd still counts as "in second brain".
		local function sync_stay_centered()
			local ok, stay_centered = pcall(require, 'stay-centered')
			if not ok then
				return
			end

			local sb_path = nkl.second_brain.get_second_brain_path()
			if not sb_path then
				return
			end

			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
			local buf_in_sb = bufname ~= '' and vim.startswith(vim.fn.fnamemodify(bufname, ':p'), sb_path)

			if nkl.second_brain.is_second_brain_path() or buf_in_sb then
				stay_centered.enable()
			else
				stay_centered.disable()
			end
		end

		vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'DirChanged', 'VimEnter' }, {
			desc = 'Auto enable Stay Centered in second brain',
			group = nkl.conf.augroup('stay_centered_in_second_brain'),
			callback = sync_stay_centered,
		})

		sync_stay_centered()
	end,
}
