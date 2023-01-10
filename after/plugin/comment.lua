local status_ok, comment = pcall(require, 'mini.comment')
if not status_ok then
	return
end

comment.setup({
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		-- Toggle comment (like `gcip` - comment inner paragraph) for both
		-- Normal and Visual modes
		comment = 'gc',

		-- Toggle comment on current line
		comment_line = 'gcc',

		-- Define 'comment' textobject (like `dgc` - delete whole comment block)
		textobject = 'gc',
	},
	-- Hook functions to be executed at certain stage of commenting
	hooks = {
		-- Before successful commenting. Does nothing by default.
		pre = function()
			require('ts_context_commentstring.internal').update_commentstring()
		end,
		-- After successful commenting. Does nothing by default.
		post = function() end,
	},
})
