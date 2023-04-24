return {
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require('gitsigns').setup({
			signs = {
				add = { text = '▎' },
				change = { text = '▎' },
				delete = { text = '契' },
				topdelete = { text = '契' },
				changedelete = { text = '▎' },
				untracked = { text = '▎' },
			},
			numhl = true,
			preview_config = { border = 'rounded' },
			signcolumn = false,
			trouble = false,
			update_debounce = 284,
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map('n', '<leader>hb', function()
					gs.blame_line({ full = true })
				end, 'Blame Line')
				map('n', '<leader>hD', function()
					gs.diffthis('~')
				end, 'Diff This ~')
				map('n', '<leader>hd', gs.diffthis, 'Diff This')
				map('n', '<leader>hj', gs.next_hunk, 'Next Hunk')
				map('n', '<leader>hp', gs.preview_hunk, 'Preview Hunk')
				map('n', '<leader>hR', gs.reset_buffer, 'Reset Buffer')
				map('n', '<leader>hS', gs.stage_buffer, 'Stage Buffer')
				map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo Stage Hunk')
				map('n', '<leader>hk', gs.prev_hunk, 'Prev Hunk')
				map('n', '<leader>td', gs.toggle_deleted, 'Toggle Deleted')
				map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')
				map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
				map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
			end,
		})
	end,
}
