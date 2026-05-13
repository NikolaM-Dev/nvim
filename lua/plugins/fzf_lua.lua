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

	-- Use fzf-lua's as vim.ui.select implementation
	init = function()
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.select = function(items, opts, on_choice)
			local ui_select = require('fzf-lua.providers.ui_select')

			-- Register the fzf-lua picker the first time we call select.
			if not ui_select.is_registered() then
				ui_select.register(function(ui_opts)
					if ui_opts.kind == 'luasnip' then
						ui_opts.prompt = 'Snippet choice: '
						ui_opts.winopts = {
							relative = 'cursor',
							height = 0.35,
							width = 0.3,
						}
					elseif ui_opts.kind == 'color_presentation' then
						ui_opts.winopts = {
							relative = 'cursor',
							height = 0.35,
							width = 0.3,
						}
					else
						ui_opts.winopts = { height = 0.5, width = 0.4 }
					end

					-- Use the kind (if available) to set the previewer's title.
					if ui_opts.kind then
						ui_opts.winopts.title = string.format(' %s ', ui_opts.kind)
					end

					-- Ensure that there's a space at the end of the prompt.
					if ui_opts.prompt and not vim.endswith(ui_opts.prompt, ' ') then
						ui_opts.prompt = ui_opts.prompt .. ' '
					end

					return ui_opts
				end)
			end

			-- Don't show the picker if there's nothing to pick.
			if #items > 0 then
				return vim.ui.select(items, opts, on_choice)
			end
		end
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
