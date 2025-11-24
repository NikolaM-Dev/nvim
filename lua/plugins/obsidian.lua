---@module 'lazy.types'
---@type LazySpec
return {
	'obsidian-nvim/obsidian.nvim',
	desc = 'Obsidian 🤝 Neovim',
	enabled = true,

	ft = 'markdown',

	cmd = { 'Obsidian' },

	keys = {
		{ '<leader>so', '<cmd>Obsidian<cr>', desc = '[S]earch [O]bsidian Commands' },
	},

	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false,

		callbacks = {
			enter_note = function(note)
				nkl.key.bmap('n', '<Tab>', function()
					require('obsidian.api').nav_link('next')
				end, { buffer = note.bufnr, desc = '󱗖  Go to next link' })

				nkl.key.bmap('n', '<S-Tab>', function()
					require('obsidian.api').nav_link('prev')
				end, { buffer = note.bufnr, desc = '󱗖 Go to previous link' })
			end,
		},

		checkbox = {
			order = {
				' ', -- In progress
				'x', -- Done
				'-', -- Canceled
			},
		},

		completion = {
			min_chars = 0,
		},

		daily_notes = {
			folder = 'Journal/daily',
		},

		note_id_func = function()
			-- [Denote - The file-naming scheme](https://protesilaos.com/emacs/denote#h:4e9c7512-84dc-4dfb-9fa9-e15d51178e5d)
			return tostring(os.date('%Y%m%dT%H%M%S'))
		end,

		note_frontmatter_func = function(note)
			-- Add the title of the note as an alias.
			if note.title then
				note:add_alias(note.title)
			end

			local currentDate = os.date('%Y-%m-%d, %H:%M:%S')
			local frontMatter = {
				id = note.id,
				aliases = note.aliases,
				tags = note.tags,
				updatedAt = currentDate,
			}

			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					frontMatter[k] = v
				end
			end

			frontMatter.updatedAt = currentDate

			return frontMatter
		end,

		picker = {
			name = 'snacks.pick',
		},

		-- Became the maintainer are going to deprecate this module
		ui = {
			enable = false,
		},

		---@param opts { path: string, label: string, id: string|integer|?, anchor: obsidian.note.HeaderAnchor|?, block: obsidian.note.Block|? }
		wiki_link_func = function(opts)
			return require('obsidian.builtin').wiki_link_alias_only(opts)
		end,

		workspaces = {
			{
				name = 'second-brain.md',
				path = function()
					local L = require('lib')

					local path = L.second_brain.get_second_brain_path()
					if not path then
						local msg = 'second brain path env variable not found'
						L.logger:new('Obsidian'):error(msg)
						error(msg)
					end

					return path
				end,
			},
		},
	},

	---@module 'obsidian'
	---@param opts obsidian.config.ClientOpts
	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}
