---------------------------------------------------------------------
-- UTILS
---------------------------------------------------------------------

U = {}

-- Os
U.os = {
  home = os.getenv('HOME'),
  data = vim.fn.stdpath('data'),
  cache = vim.fn.stdpath('cache'),
  config = vim.fn.stdpath('config'),
  name = vim.loop.os_uname().sysname,
  is_git_dir = os.execute('git rev-parse --is-inside-work-tree >> /dev/null 2>&1'),
}

function U.nvim_create_augroup(definitions) -- {{{1
  for group_name, definition in pairs(definitions) do
    vim.cmd('augroup ' .. group_name)
    vim.cmd('autocmd!')

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
      vim.cmd(command)
    end

    vim.cmd('augroup END')
  end
end

-- Keybindings
U.keymap = {}

local function make_map(mode, lhs, rhs, opts, scope)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  if scope == nil then
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
  end
end

function U.keymap.buf_nmap(lhs, rhs, opts)
  return make_map('n', lhs, rhs, opts, 'buffer')
end

function U.keymap.nmap(lhs, rhs, opts)
  return make_map('n', lhs, rhs, opts)
end

function U.keymap.imap(lhs, rhs, opts)
  return make_map('i', lhs, rhs, opts)
end

function U.keymap.xmap(lhs, rhs, opts)
  return make_map('x', lhs, rhs, opts)
end

function U.keymap.tmap(lhs, rhs, opts)
  return make_map('t', lhs, rhs, opts)
end

function U.keymap.cmap(lhs, rhs)
  return make_map('c', lhs, rhs, {silent = false, noremap = false})
end

---------------------------------------------------------------------
-- SETTINGS
---------------------------------------------------------------------

local o = vim.opt

-- Appearance
o.cmdheight = 1
o.cursorline = true
o.number = true
o.relativenumber = true
o.showmode = false
o.signcolumn = 'yes'
o.termguicolors = true
o.wrap = false

-- Backups
o.backup = false
o.writebackup = false
o.swapfile = false

-- Completion
o.completeopt = 'menuone,noselect'
o.pumheight = 6
o.pumblend = 10

-- General
o.clipboard = 'unnamedplus'
o.hidden = true
o.joinspaces = false
o.scrolloff = 4
o.splitbelow = true
o.splitright = true
o.timeoutlen = 1000
o.updatetime = 100
o.virtualedit = 'block'
o.iskeyword = o.iskeyword + '-'

-- Performance
o.lazyredraw = true

-- Search
o.inccommand = 'nosplit' -- show substitutions incrementally
o.ignorecase = true
o.smartcase = true
o.wildignore = '.git,**/node_modules/**';
o.wildignorecase = true

-- Tabs
o.expandtab = false
o.shiftwidth = 4

-- Shortmess
o.shortmess = o.shortmess + 'A' + 'c' + 'I' + 'W'

-- Format options
o.formatoptions = o.formatoptions + 'j' -- Auto-remove comments when combining lines ( <C-J> )
+ 'n' -- Indent past the formatlistpat, not underneath it.
+ 'q' -- Allow formatting comments w/ gq
- 'c' -- In general, I like it when comments respect textwidth
- 'r' -- But do continue when pressing enter.
- 'o' -- O and o, don't continue comments
- 't' -- Don't auto format my code. I got linters for that.

---------------------------------------------------------------------
-- PLUGINS
---------------------------------------------------------------------

---------------------------------------------------------------------
-- KEYMAPS 
---------------------------------------------------------------------

---------------------------------------------------------------------
-- AUTOCOMMANDS
---------------------------------------------------------------------

U.nvim_create_augroup({
  on_save = {
    {'BufWritePost', '*.vim,*.lua', 'source %'},
  },
  general = {
    {'TextYankPost', '*', 'silent! lua vim.highlight.on_yank { timeout = 150 }'},
    {'FileType', '*', 'set fo-=cro'}, -- Avoid newline continuation of comments
  },
})
