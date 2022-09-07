local status_ok, rest = pcall(require, 'rest-nvim')
if not status_ok then
	return
end

rest.setup({
	-- Open request results in a horizontal split
	result_split_horizontal = false,
	-- Keep the http file buffer above|left when split horizontal|vertical
	result_split_in_place = false,
	-- Skip SSL verification, useful for unknown certificates
	skip_ssl_verification = false,
	-- Encode URL before making request
	encode_url = true,
	-- Highlight request on run
	highlight = {
		enabled = true,
		timeout = 150,
	},
	result = {
		-- toggle showing URL, HTTP info, headers at top the of result window
		show_url = true,
		show_http_info = true,
		show_headers = true,
		-- executables or functions for formatting response body [optional]
		-- set them to nil if you want to disable them
		formatters = {
			json = 'jq',
			html = function(body)
				return vim.fn.system({ 'tidy', '-i', '-q', '-' }, body)
			end,
		},
	},
	-- Jump to request line on run
	jump_to_request = false,
	env_file = '.env',
	custom_dynamic_variables = {},
	yank_dry_run = true,
})

vim.api.nvim_create_autocmd({ 'Filetype' }, {
	pattern = 'http',
	callback = function()
		local buff = tonumber(vim.fn.expand('<abuf>'), 10)

		vim.keymap.set('n', '<leader>rp', function()
			rest.run(true)
		end, { noremap = true, buffer = buff })
		vim.keymap.set('n', '<leader>rn', rest.run, { noremap = true, buffer = buff })
		vim.keymap.set('n', '<leader>rl', rest.last, { noremap = true, buffer = buff })
	end,
})
