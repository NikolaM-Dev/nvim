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

		---Filetypes considered reading material where centered cursor feels good.
		local reading_filetypes = {
			markdown = true,
			text = true,
			plaintext = true,
			rst = true,
			asciidoc = true,
			org = true,
			norg = true,
			help = true,
			man = true,
		}

		---Enable stay-centered inside the second brain or in any reading buffer,
		---disable elsewhere.
		---Checks both the cwd and the current buffer path so opening a note
		---via absolute path from another cwd still counts as "in second brain".
		local function sync_stay_centered()
			local ok, stay_centered = pcall(require, 'stay-centered')
			if not ok then
				return
			end

			local bufnr = vim.api.nvim_get_current_buf()
			local bufname = vim.api.nvim_buf_get_name(bufnr)

			local sb_path = nkl.second_brain.get_second_brain_path()
			local buf_in_sb = sb_path ~= nil
				and bufname ~= ''
				and vim.startswith(vim.fn.fnamemodify(bufname, ':p'), sb_path)

			if nkl.second_brain.is_second_brain_path() or buf_in_sb then
				stay_centered.enable()
				return
			end

			local buftype = vim.bo[bufnr].buftype
			if (buftype == '' or buftype == 'help') and reading_filetypes[vim.bo[bufnr].filetype] then
				stay_centered.enable()
			else
				stay_centered.disable()
			end
		end

		vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'DirChanged', 'VimEnter', 'FileType' }, {
			desc = 'Auto enable Stay Centered for second brain and reading material',
			group = nkl.conf.augroup('stay_centered_in_second_brain'),
			callback = sync_stay_centered,
		})

		sync_stay_centered()
	end,
}
