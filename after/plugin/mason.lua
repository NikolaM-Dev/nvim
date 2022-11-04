local status_ok, mason = pcall(require, 'mason')
if not status_ok then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, 'mason-null-ls')
if not mason_null_ls_status then
	return
end

local keymap = require('core.keymap')

local cmd = keymap.cmd
local nmap = keymap.nmap
local noremap = keymap.noremap
local opts = keymap.new_opts

mason.setup({
	ui = {
		-- Whether to automatically check for new versions when opening the :Mason window.
		check_outdated_packages_on_open = true,

		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = 'rounded',

		icons = {
			-- The list icon to use for installed servers.
			package_installed = ' ',
			-- The list icon to use for servers that are pending installation.
			package_pending = ' ',
			-- The list icon to use for servers that are not installed.
			package_uninstalled = ' ﮊ',
		},

		keymaps = {
			-- Keymap to expand a package
			toggle_package_expand = '<CR>',
			-- Keymap to install the package under the current cursor position
			install_package = 'i',
			-- Keymap to reinstall/update the package under the current cursor position
			update_package = 'u',
			-- Keymap to check for new version for the package under the current cursor position
			check_package_version = 'c',
			-- Keymap to update all installed packages
			update_all_packages = 'U',
			-- Keymap to check which installed packages are outdated
			check_outdated_packages = 'C',
			-- Keymap to uninstall a package
			uninstall_package = 'X',
			-- Keymap to cancel a package installation
			cancel_installation = '<C-c>',
			-- Keymap to apply language filter
			apply_language_filter = '<C-f>',
		},
	},

	pip = {
		-- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
		-- and is not recommended.
		--
		-- Example: { "--proxy", "https://proxyserver" }
		install_args = {},
	},

	-- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
	-- debugging issues with package installations.
	log_level = vim.log.levels.INFO,

	-- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
	-- packages that are requested to be installed will be put in a queue.
	max_concurrent_installers = 4,

	github = {
		-- The template URL to use when downloading assets from GitHub.
		-- The placeholders are the following (in order):
		-- 1. The repository (e.g. "rust-lang/rust-analyzer")
		-- 2. The release version (e.g. "v0.3.0")
		-- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
		download_url_template = 'https://github.com/%s/releases/download/%s/%s',
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		'cssls',
		'emmet_ls',
		'gopls',
		'html',
		'jsonls',
		'sumneko_lua',
		'tailwindcss',
		'taplo',
		'tsserver',
		'vimls',
	},
	automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = {
		'eslint_d',
		'gofumpt',
		'goimports',
		'prettier',
		'staticcheck',
		'stylua',
	},
	automatic_installation = true,
})

nmap({ '<leader>m', cmd('Mason'), opts(noremap) })
