#  Neovim

## 🔥 in Progress

- [ ] Here 🙋
- [ ] Web development
  - [ ] TypeScript tools
  - [ ] Tailwind tools
  - [ ] DAP
  - [ ] Testing

## 🥶 Wait

## 🔮 Next

## 📌 Refile

```lua
local function quickType(lang)
    -- source from clipboard registry
    local buf = vim.fn.getreg('+')
    local tmp = vim.fn.tempname() .. '.json'
    local f = io.open(tmp, 'w')
    f:write(buf)
    f:close()

    local cmd = 'quicktype ' .. tmp .. ' --lang ' .. lang .. ' --just-types 2>&1'
    local output = vim.fn.systemlist(cmd)

    if vim.v.shell_error ~= 0 then
        vim.notify(table.concat(output, '\n'), vim.log.levels.ERROR)
        return
    end
    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, row, row, false, output)
end

vim.keymap.set('n', '<leader>pc', function()
    local currentFiletype = vim.bo.filetype

    if currentFiletype == 'go' then
        currentFileType = 'golang'
    end

    quickType(currentFiletype)
end)

vim.keymap.set('n', '<leader>pg', function()
    quickType('golang')
end)

vim.keymap.set('n', '<leader>pt', function()
    quickType('typescript')
end)

vim.keymap.set('n', '<leader>pz', function()
    quickType('typescript-zod')
end)

local wk = require('which-key')
wk.add({
    { '<leader>p', group = 'Paste to type' },
    { '<leader>pc', desc = 'Paste to type (current filetype)' },
    { '<leader>pg', desc = 'Paste to golang type' },
    { '<leader>pt', desc = 'Paste to typescript type' },
    { '<leader>pz', desc = 'Paste to typescript-zod type' },
})
return {}
```

## 🎒 Backlog

- [ ] My own emoji blink cmp
- [ ] Setup freciency using snacks
- [ ] Update emmet cmp
- [ ] setup gh markdown-preview with Neovim
- [ ] Improve the `tmux_prefix` plugin to use `n-tmux-is-running` validaiton.
- [ ] Clean the stash
- [ ] Review the branches
- [ ] Change to use the folke plugin to highlight tags in my second brain. See
      also if it's possible to use it for conditional rendering in React
- [ ] Change to use fzf with skim

---

## 🗃️ Archive
