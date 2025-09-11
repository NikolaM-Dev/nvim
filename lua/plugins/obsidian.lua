---@module 'lazy.types'
---@type LazyPluginSpec
return {
	'obsidian-nvim/obsidian.nvim',
	desc = 'Obsidian 🤝 Neovim',
	enabled = true,

	ft = 'markdown',

	cmd = { 'Obsidian' },

	keys = {
		{ '<leader>o', '<cmd>Obsidian<cr>', desc = '[O]bsidian' },
	},

	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false,

		checkbox = {
			order = {
				' ', -- In progress
				'x', -- Done
				'-', -- Canceled
			},
		},

		completion = {
			blink = false,
			min_chars = 0,
			nvim_cmp = false,
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

		-- Becase the manteiner are going to deprecate this module
		ui = {
			enable = false,
		},

		wiki_link_func = function()
			return 'use_alias_only'
		end,

		workspaces = {
			{
				name = 'second-brain.md',
				path = os.getenv('SECOND_BRAIN_PATH') .. '/src',
			},
		},
	},

	---@module 'obsidian'
	---@param opts obsidian.config.ClientOpts
	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}
