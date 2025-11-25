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

		note_id_func = function(title, _path)
			return nkl.string.title_case(title)
		end,

		frontmatter = {
			sort = { 'id', 'aliases', 'tags', 'createdAt', 'updatedAt' },
			func = function(note)
				-- Add the title of the note as an alias.
				if note.title then
					note:add_alias(note.title)
				end

				local updatedAt = os.date('%Y-%m-%d, %H:%M:%S')

				---Verify and return a Denote-style ID (YYYYMMDDTHHmmss) for the current note.
				---
				---See: [Denote - The file-naming scheme](https://protesilaos.com/emacs/denote#h:4e9c7512-84dc-4dfb-9fa9-e15d51178e5d)
				---@return string id Denote-style ID (e.g. "20251125T142530") or `''` on error.
				local function get_id()
					local year = os.date('%Y')
					local has_denote_id_scheme = note.id:sub(1, 4) == year
					if has_denote_id_scheme then
						return note.id
					end

					local buf = vim.api.nvim_buf_get_name(0)
					if buf == '' then
						nkl.logger:new('Obsidian'):error('No file in buffer')
						return ''
					end

					local file_full_path = vim.fn.fnamemodify(buf, ':p')
					local birth_time = vim.fn.system({ 'n-file-birth-time', file_full_path })

					return vim.trim(birth_time)
				end

				local frontMatter = {
					id = get_id(),
					aliases = note.aliases,
					tags = note.tags,
					createdAt = string.format('[[%s]]', os.date('%Y-%m-%d')),
					updatedAt = updatedAt,
				}

				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						frontMatter[k] = v
					end
				end

				frontMatter.updatedAt = updatedAt

				return frontMatter
			end,
		},

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
	---@param opts obsidian.config
	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}
