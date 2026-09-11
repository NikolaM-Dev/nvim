---@module 'lazy.types'
---@type LazySpec
return {
	'obsidian-nvim/obsidian.nvim',
	desc = 'Obsidian 🤝 Neovim',
	enabled = true,

	ft = 'markdown',

	cmd = { 'Obsidian' },

	keys = {
		{ '<leader>O', '<cmd>Obsidian open<cr>', desc = '󱗖  Obsidian Open' },
		{ '<leader>oT', '<cmd>Obsidian toc<cr>', desc = '󱗖  Obsidian Table of Contents' },
		{ '<leader>so', '<cmd>Obsidian<cr>', desc = '󱗖  Obsidian Search Commands' },
	},

	init = function()
		vim.o.conceallevel = 2
	end,

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

		footer = {
			separator = string.rep('─', 80),
		},

		frontmatter = {
			sort = { 'id', 'aliases', 'tags', 'createdAt', 'updatedAt' },
			func = function(note)
				local logger = nkl.logger:new('Obsidian')

				---Return the first `# Heading` in the buffer, or `nil`.
				---@param bufnr integer|nil
				---@return string|nil
				local function get_title(bufnr)
					if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
						return nil
					end
					-- Only scan the top of the file: title should be near the top,
					-- and this avoids reading huge notes on every save.
					local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 100, false)
					for _, line in ipairs(lines) do
						-- Require a space after `#` so `#tag` is not treated as a heading.
						local t = line:match('^#+%s+(.+)%s*$')
						if t then
							t = vim.trim(t)
							if t ~= '' then
								return t
							end
						end
					end
					return nil
				end

				local current_title = get_title(note.bufnr)
				-- Add the title of the note as an alias.
				-- NOTE: `note.title` was removed from obsidian.nvim, so we parse it from the buffer.

				local updatedAt = os.date('%Y-%m-%d, %H:%M:%S')

				---Check whether `id` is a Denote-style ID (YYYYMMDDTHHmmss).
				---
				---See: [Denote - The file-naming scheme](https://protesilaos.com/emacs/denote#h:4e9c7512-84dc-4dfb-9fa9-e15d51178e5d)
				---@param id any
				---@return boolean
				local function is_denote_id(id)
					if type(id) ~= 'string' then
						return false
					end
					return id:match('^%d%d%d%d%d%d%d%dT%d%d%d%d%d%d$') ~= nil
					end

				---Fall back to the file birth time via `n-file-birth-time`.
				---@param bufnr integer|nil
				---@return string birth time in Denote format, or `''` on error.
				local function get_birth_id(bufnr)
					local buf = (bufnr and vim.api.nvim_buf_is_valid(bufnr)) and vim.api.nvim_buf_get_name(bufnr) or ''
					if buf == '' then
						logger:error('No file in buffer')
						return ''
					end

					if vim.fn.executable('n-file-birth-time') == 0 then
						logger:error('`n-file-birth-time` not found')
						return ''
					end

					local file_full_path = vim.fn.fnamemodify(buf, ':p')
					local birth_time = vim.fn.system({ 'n-file-birth-time', file_full_path })
					if vim.v.shell_error ~= 0 then
						logger:warn('Failed to get birth time for: ' .. file_full_path)
						return ''
					end

					local trimmed = vim.trim(birth_time)
					if not is_denote_id(trimmed) then
						logger:warn('Birth time does not match Denote format: ' .. trimmed)
						return ''
					end

					return trimmed
				end

				local function get_id()
					if is_denote_id(note.id) then
						return note.id
					end

					return get_birth_id(note.bufnr)
				end

				-- Merge the buffer title into aliases without dropping existing ones.
				---@param base string[]|nil
				---@param title string|nil
				---@return string[]
				local function get_aliases(base, title)
					local seen = {}
					---@type string[]
					local aliases = {}
					for _, a in ipairs(base or {}) do
						if a and a ~= '' and not seen[a] then
							seen[a] = true
							table.insert(aliases, a)
						end
					end
					if title and title ~= '' and not seen[title] then
						table.insert(aliases, 1, title)
					end
					return aliases
				end

				-- Preserve the original creation date instead of resetting it on every save.
				local createdAt = note.metadata and note.metadata.createdAt
					or string.format('[[%s]]', os.date('%Y-%m-%d'))

				local frontMatter = {
					id = get_id(),
					aliases = get_aliases(note.aliases, current_title),
					tags = note.tags or {},
					createdAt = createdAt,
					updatedAt = updatedAt,
				}

				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept, without clobbering the computed core fields.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						if frontMatter[k] == nil then
							frontMatter[k] = v
						end
					end
				end

				return frontMatter
			end,
		},

		picker = {
			name = 'fzf-lua',
		},

		-- Became the maintainer are going to deprecate this module
		ui = {
			enable = false,
			enabled = false,
		},

		link = {
			style =
				---@param opts obsidian.link.LinkCreationOpts
				---@return string
				function(opts)
					---@type string
					local header_or_block = ''
					if opts.anchor then
						header_or_block = string.format('#%s', opts.anchor.header)
					elseif opts.block then
						header_or_block = string.format('#%s', opts.block.id)
					end

					return string.format('[[%s%s]]', opts.label, header_or_block)
				end,
		},

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
		---@type obsidian.config.UIOpts
		local ui_options = {
			enable = true,
			ignore_conceal_warn = false,
			update_debounce = 200,
			max_file_length = 5000,
			checkboxes = {},
			-- checkboxes = {
			-- 	[' '] = { char = '󰄱', hl_group = 'obsidiantodo' },
			-- 	['~'] = { char = '󰰱', hl_group = 'obsidiantilde' },
			-- 	['!'] = { char = '', hl_group = 'obsidianimportant' },
			-- 	['>'] = { char = '', hl_group = 'obsidianrightarrow' },
			-- 	['x'] = { char = '', hl_group = 'obsidiandone' },
			-- },
			-- bullets = { char = '•', hl_group = 'ObsidianBullet' },
			bullets = nil,
			block_ids = nil,
			external_link_icon = nil,
			reference_text = nil,
			highlight_text = nil,
			-- external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
			-- reference_text = { hl_group = 'ObsidianRefText' },
			-- highlight_text = { hl_group = 'ObsidianHighlightText' },
			tags = { hl_group = 'ObsidianTag' },
			-- block_ids = { hl_group = 'ObsidianBlockID' },
			hl_groups = {
				-- ObsidianTodo = { bold = true, fg = '#f78c6c' },
				-- ObsidianDone = { bold = true, fg = '#89ddff' },
				-- ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
				-- ObsidianTilde = { bold = true, fg = '#ff5370' },
				-- ObsidianImportant = { bold = true, fg = '#d73128' },
				-- ObsidianBullet = { bold = true, fg = '#89ddff' },
				-- ObsidianRefText = { underline = true, fg = '#c792ea' },
				-- ObsidianExtLinkIcon = { fg = '#c792ea' },
				ObsidianTag = {
					-- fg = '#6196A0',
					fg = '#76e3ea',
					italic = true,
				},
				-- ObsidianBlockID = { italic = true, fg = '#89ddff' },
				-- ObsidianHighlightText = { bg = '#75662e' },
			},
		}

		nkl.markdown_tags.setup(ui_options)
	end,
}
