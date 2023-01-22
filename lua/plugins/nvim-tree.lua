local M = {
	'nvim-tree/nvim-tree.lua',
	dependencies = 'nvim-tree/nvim-web-devicons',
	cmd = 'NvimTreeToggle',
	keys = {
		{ '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Explorer' },
	},
}

function M.config()
	local nvim_tree = require('nvim-tree')

	-- Git stage
	local lib = require('nvim-tree.lib')
	local view = require('nvim-tree.view')

	local function collapse_all()
		require('nvim-tree.actions.tree-modifiers.collapse-all').fn()
	end

	local function edit_or_open()
		-- open as vsplit on current node
		local action = 'edit'
		local node = lib.get_node_at_cursor()

		-- Just copy what's done normally with vsplit
		if node.link_to and not node.nodes then
			require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
			view.close() -- Close the tree if file was opened
		elseif node.nodes ~= nil then
			lib.expand_or_collapse(node)
		else
			require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
			view.close() -- Close the tree if file was opened
		end
	end

	local function vsplit_preview()
		-- open as vsplit on current node
		local action = 'vsplit'
		local node = lib.get_node_at_cursor()

		-- Just copy what's done normally with vsplit
		if node.link_to and not node.nodes then
			require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
		elseif node.nodes ~= nil then
			lib.expand_or_collapse(node)
		else
			require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
		end

		-- Finally refocus on tree if it was lost
		view.focus()
	end

	local git_add = function()
		local node = lib.get_node_at_cursor()
		local gs = node.git_status

		-- If the file is untracked, unstaged or partially staged, we stage it
		if gs == '??' or gs == 'MM' or gs == 'AM' or gs == ' M' then
			vim.cmd('silent !git add ' .. node.absolute_path)

		-- If the file is staged, we unstage
		elseif gs == 'M ' or gs == 'A ' then
			vim.cmd('silent !git restore --staged ' .. node.absolute_path)
		end

		lib.refresh_tree()
	end

	nvim_tree.setup({
		disable_netrw = true,
		hijack_netrw = true,
		open_on_setup = true,
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		ignore_ft_on_setup = {
			'startify',
			'dashboard',
			'alpha',
		},
		open_on_tab = false,
		hijack_cursor = false,
		update_cwd = true,
		reload_on_bufenter = true,
		renderer = {
			root_folder_modifier = ':t',
			highlight_git = true,
			indent_markers = {
				enable = true,
			},
			icons = {
				webdev_colors = true,
				git_placement = 'before',
				padding = ' ',
				symlink_arrow = ' ➛ ',
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				glyphs = {
					default = '',
					symlink = '',
					git = {
						unstaged = '',
						staged = 'S',
						unmerged = '',
						renamed = '➜',
						deleted = '',
						untracked = 'U',
						ignored = '◌',
					},
					folder = {
						default = '',
						open = '',
						empty = '',
						empty_open = '',
						symlink = '',
					},
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = '',
				info = '',
				warning = '',
				error = '',
			},
		},
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
		},
		system_open = {
			cmd = nil,
			args = {},
		},
		filters = {
			dotfiles = false,
			custom = { '^.git$' },
		},
		git = {
			enable = true,
			ignore = true,
			timeout = 500,
		},
		view = {
			width = 30,
			adaptive_size = true,
			hide_root_folder = false,
			side = 'left',
			mappings = {
				custom_only = false,
				list = {
					{ key = 'l', action = 'edit', action_cb = edit_or_open },
					{ key = 'L', action = 'vsplit_preview', action_cb = vsplit_preview },
					{ key = 'h', action = 'close_node' },
					{ key = 'H', action = 'collapse_all', action_cb = collapse_all },
					{ key = 'ga', action = 'git_add', action_cb = git_add },
				},
			},
			number = false,
			relativenumber = false,
		},
		trash = {
			cmd = 'trash',
			require_confirm = true,
		},
		actions = {
			open_file = {
				quit_on_open = false,
				resize_window = true,
				window_picker = {
					enable = true,
				},
			},
		},
	})
end

return M
