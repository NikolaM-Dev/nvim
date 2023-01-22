return {
  'folke/tokyonight.nvim',
  -- lazy = false,
  event = 'VimEnter',
  priority = 1000,
  config = function()
    local tokyonight = require('tokyonight')

    tokyonight.setup({
      dim_inactive = true,
      styles = {
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        functions = { bold = true },
      },
      sidebars = {
        'help',
        'outline',
        'qf',
        'spectre_panel',
        'startuptime',
        'terminal',
        'vista_kind',
      },
      on_highlights = function(hl, c)
        hl.TelescopeBorder = { fg = c.comment }
      end,
    })

    tokyonight.load()
  end,
}
