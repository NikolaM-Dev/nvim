return {
	'folke/trouble.nvim',
	cmd = { 'TroubleToggle', 'Trouble' },
	keys = {
		{ 'gR', '<cmd>TroubleToggle lsp_references<cr>', desc = 'Trouble Lsp [R]eferences' },
		{ '<leader>;d', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Trouble [D]ocument [D]iagnostics' },
		{ '<leader>;l', '<cmd>TroubleToggle loclist<cr>', desc = 'Trouble [L]oclist' },
		{ '<leader>;q', '<cmd>TroubleToggle quickfix<cr>', desc = 'Trouble [Q]uickfix ' },
		{ '<leader>;w', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Trouble [W]orkspace Diagnostics ' },
		{ '<leader>;x', '<cmd>TroubleToggle<cr>', desc = 'Toggle Trouble' },
		{
			'<leader>xk',

			function()
				if require('trouble').is_open() then
					require('trouble').previous({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cprev)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = 'Previous trouble/quickfix item',
		},
		{
			'<leader>xj',
			function()
				if require('trouble').is_open() then
					require('trouble').next({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cnext)
					if not ok then
						---@diagnostic disable-next-line: param-type-mismatch
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = 'Next trouble/quickfix item',
		},
	},
	opts = {
		auto_close = true,
		fold_closed = '',
		fold_open = '',
		padding = false,
		position = 'right',
		signs = {
			error = '󰅙',
			hint = '󰌵',
			information = '󰋼',
			other = '󰄳',
			warning = '',
		},
	},
}
