local config = {}

function config.base46()
  local base46 = require('base46')
  base46.setup({ theme = 'gruvchad' })
end

function config.nvim_tree()
  -- On Ready Event for Lazy Loading work
  require('nvim-tree.events').on_nvim_tree_ready(
    function()
      vim.cmd('NvimTreeRefresh')
    end
  )

  vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = '',
      staged = '',
      unmerged = '',
      renamed = '',
      untracked = 'ﲉ',
      deleted = '',
      ignored = '',
    },
    folder = {
      arrow_open = '',
      arrow_closed = '',
      default = '',
      open = '',
      empty = '',
      empty_open = '',
      symlink = '',
      symlink_open = '',
    },
  }

  require('nvim-tree').setup {}
end

return config
