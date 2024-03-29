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
-- o.mouse = 'a'
o.scrolloff = 8
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
o.expandtab = true
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
