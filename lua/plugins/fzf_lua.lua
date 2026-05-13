return {
	'ibhagwan/fzf-lua',
	desc = 'Improved fzf.vim written in lua',
	enabled = true,

	keys = function()
		local fzf = require('fzf-lua')
		return {
			-- stylua: ignore start
			-- find
			{ '<leader>ff', function() fzf.files() end, desc = ' Find Files' },

			-- search
			{ '<leader>sg', function() fzf.live_grep() end, desc = ' Search Grep' },

			-- git
			{ '<leader>gS', function() fzf.git_stash() end, desc = ' Git Stash' },
			{ '<leader>gs', function() fzf.git_status() end, desc = ' Git Status' },

			-- others
			{ 'z=', function() fzf.spell_suggest() end, desc = ' Spell Suggest' },
			-- stylua: ignore end
		}
	end,

	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {
		{ 'hide' },
		fzf_opts = {
			['--prompt'] = ' ',
			['--pointer'] = '',
			['--border'] = 'none',
		},
		fzf_bin = 'sk',
		keymap = {
			fzf = {
				['ctrl-o'] = 'toggle-all',
				['ctrl-d'] = 'preview-page-down',
				['ctrl-u'] = 'preview-page-up',
			},
		},
		files = {
			cwd_prompt = false,
			winopts = {
				preview = { hidden = true },
				width = 0.5,
				height = 0.4,
			},
		},
	},
	---@diagnostic enable: missing-fields
}
