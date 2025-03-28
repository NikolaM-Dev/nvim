---@type LazySpec
return {
	'ThePrimeagen/harpoon',
	enabled = true,

	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = function()
		local harpoon = require('harpoon')

		local keys = {}

		table.insert(keys, {
			'<C-e>',
			function()
				harpoon.ui:toggle_quick_menu(harpoon:list(), { title = '  Harpoon ' })
			end,
			desc = 'Toggle harpoon quick menu',
		})

		table.insert(keys, {
			'<leader>a',
			function()
				harpoon:list():add()
			end,
			desc = '[A]dd file to harpoon list',
		})

		for i = 1, 9 do
			table.insert(keys, {
				string.format('<leader>%s', i),

				function()
					harpoon:list():select(i)

					local file_type = vim.bo.filetype
					local local_opts = '~/.config/nvim/after/ftplugin/' .. file_type .. '.lua'

					vim.cmd('silent! source ' .. local_opts)
				end,
				desc = 'Harpoon select file in position ' .. i,
			})
		end

		return keys
	end,
	config = function()
		local harpoon = require('harpoon')

		harpoon:setup({
			settings = {
				save_on_toggle = true,
			},
		})
	end,
}
