local bookmarks = require('plugins.browse.bookmarks').get_bookmarks()

---@type LazySpec
return {
	'NikolaM-Dev/browse.nvim',
	enabled = true,

	keys = {
		{
			'<leader>bb',
			function()
				require('browse').open_bookmarks({ bookmarks = bookmarks })
			end,
			desc = '[B]rowse [B]ookmarks',
		},
	},

	opts = {
		bookmarks = bookmarks,
		icons = {
			bookmark_alias = '',
			bookmarks_prompt = '󰂺 ',
			grouped_bookmarks = '',
		},
		persist_grouped_bookmarks_query = true,
	},

	config = function(_, opts)
		require('browse').setup(opts)
	end,
}
