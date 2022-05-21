local global = require('core.global')

local function bind_option(options)
  for k, v in pairs(options) do
    if v == true then
      vim.cmd('set ' .. k)
    elseif v == false then
      vim.cmd('set no' .. k)
    else
      vim.cmd('set ' .. k .. '=' .. v)
    end
  end
end

local function load_options()
  local global_local = {
    backspace      = 'indent,eol,start',
    backup         = false,
    backupdir      = global.cache_dir .. 'backup/',
    backupskip     = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim',
    breakat        = [[\ \	,:,!?]],
    clipboard      = 'unnamedplus',
    cmdheight      = 2,
    cmdwinheight   = 5,
    complete       = '.,w,b,k',
    completeopt    = 'menuone,noselect',
    diffopt        = 'filler,iwhite,internal,algorithm:patience',
    directory      = global.cache_dir .. 'swap/',
    display        = 'lastline',
    encoding       = 'utf-8',
    equalalways    = false,
    errorbells     = true,
    fileformats    = 'unix,mac,dos',
    foldlevelstart = 99,
    grepformat     = '%f:%l:%c:%m',
    grepprg        = 'rg --hidden --vimgrep --smart-case --',
    helpheight     = 12,
    hidden         = true,
    history        = 2000,
    ignorecase     = true,
    inccommand     = 'nosplit',
    incsearch      = true,
    infercase      = true,
    jumpoptions    = 'stack',
    laststatus     = 2,
    list           = true,
    listchars      = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←',
    magic          = true,
    mouse          = 'nv',
    previewheight  = 12,
    pumblend       = 10,
    pumheight      = 15,
    redrawtime     = 1500,
    ruler          = false,
    scrolloff      = 2,
    sessionoptions = 'curdir,help,tabpages,winsize',
    shada          = '!,\'300,<50,@100,s10,h',
    shiftround     = true,
    shortmess      = 'aoOTIcF',
    showbreak      = '↳  ',
    showcmd        = false,
    showmode       = false,
    showtabline    = 2,
    sidescrolloff  = 5,
    smartcase      = true,
    smarttab       = true,
    spellfile      = global.cache_dir .. 'spell/en.uft-8.add',
    splitbelow     = true,
    splitright     = true,
    startofline    = false,
    swapfile       = false,
    switchbuf      = 'useopen',
    termguicolors  = true,
    timeout        = true,
    timeoutlen     = 500,
    ttimeout       = true,
    ttimeoutlen    = 10,
    undodir        = global.cache_dir .. 'undo/',
    updatetime     = 100,
    viewdir        = global.cache_dir .. 'view/',
    viewoptions    = 'folds,cursor,curdir,slash,unix',
    virtualedit    = 'block',
    visualbell     = true,
    whichwrap      = 'h,l,<,>,[,],~',
    wildignore     = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**',
    wildignorecase = true,
    winblend       = 10,
    winminwidth    = 10,
    winwidth       = 30,
    wrapscan       = true,
    writebackup    = false,
  }

  local bw_local = {
    autoindent     = true,
    breakindentopt = 'shift:2,min:20',
    colorcolumn    = '80',
    concealcursor  = 'niv',
    conceallevel   = 2,
    expandtab      = true,
    foldenable     = true,
    formatoptions  = '1jcroql',
    linebreak      = true,
    number         = true,
    shiftwidth     = 2,
    signcolumn     = 'yes',
    softtabstop    = -1,
    synmaxcol      = 2500,
    tabstop        = 2,
    textwidth      = 80,
    undofile       = true,
    wrap           = false,
  }

  if global.is_mac then
    vim.g.clipboard = {
      name = 'macOS-clipboard',
      copy = {
        ['+'] = 'pbcopy',
        ['*'] = 'pbcopy',
      },
      paste = {
        ['+'] = 'pbpaste',
        ['*'] = 'pbpaste',
      },
      cache_enabled = 0,
    }
    vim.g.python_host_prog = '/usr/bin/python'
    vim.g.python3_host_prog = '/usr/local/bin/python3'
  end

  for name, value in pairs(global_local) do
    vim.opt[name] = value
  end

  bind_option(bw_local)
end

load_options()
