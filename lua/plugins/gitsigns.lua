---@module 'lazy'
---@type LazySpec
return {
	'lewis6991/gitsigns.nvim',
	desc = 'Git integration for buffers',
	enabled = true,

	events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
	opts = {
		attach_to_untracked = true,
		on_attach = function(bufnr)
			local gitsigns = require('gitsigns')

			local function map(mode, lhs, rhs, opts)
				opts = opts or {}
				opts.buffer = bufnr

				vim.keymap.set(mode, lhs, rhs, opts)
			end

			-- Navigation
			map('n', ']c', function()
				if vim.wo.diff then
					vim.cmd.normal({ ']c', bang = true })
				else
					gitsigns.nav_hunk('next')
				end
			end, { desc = 'Next [C]hange' })

			map('n', '[c', function()
				if vim.wo.diff then
					vim.cmd.normal({ '[c', bang = true })
				else
					gitsigns.nav_hunk('prev')
				end
			end, { desc = 'Previous [C]hange' })

			-- Actions
			map('n', '<leader>hs', gitsigns.stage_hunk)
			map('n', '<leader>hr', gitsigns.reset_hunk)

			map('v', '<leader>hs', function()
				gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end)

			map('v', '<leader>hr', function()
				gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end)

			map('n', '<leader>hS', gitsigns.stage_buffer)
			map('n', '<leader>hR', gitsigns.reset_buffer)
			map('n', '<leader>hp', gitsigns.preview_hunk)
			map('n', '<leader>hi', gitsigns.preview_hunk_inline)

			map('n', '<leader>hb', function()
				gitsigns.blame_line({ full = true })
			end)

			map('n', '<leader>hd', function()
				_G.is_in_gitsigns_diffthis = true
				gitsigns.diffthis()
			end)

			map('n', '<leader>hD', function()
				gitsigns.diffthis('~')
			end)

			map('n', '<leader>hQ', function()
				gitsigns.setqflist('all')
			end)
			map('n', '<leader>hq', gitsigns.setqflist)

			-- Toggles
			map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
			map('n', '<leader>td', gitsigns.toggle_deleted)
			map('n', '<leader>tw', gitsigns.toggle_word_diff)

			-- Text object
			map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
		end,
	},
}
