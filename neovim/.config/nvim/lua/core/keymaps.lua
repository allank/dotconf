local nmap = U.keymap.nmap
local imap = U.keymap.imap
local tmap = U.keymap.tmap
local cmap = U.keymap.cmap
local xmap = U.keymap.xmap

vim.g.mapleader = ' '

-- Normal
nmap('<C-c>', '<Esc>')
nmap('<CR>', '{-> v:hlsearch ? ":nohl\\<CR>" : "\\<CR>"}()', {expr = true})
nmap('<C-s>', '<cmd>w<CR>')

--
-- Buffers
nmap('<Tab>', '<cmd>bn<CR>')
nmap('<S-Tab>', '<cmd>bp<CR>')
nmap('<leader>bd', '<cmd>bd<CR>')
--
-- Window
nmap('<leader>j', '<cmd>wincmd j<CR>')
nmap('<leader>k', '<cmd>wincmd k<CR>')
nmap('<leader>h', '<cmd>wincmd h<CR>')
nmap('<leader>l', '<cmd>wincmd l<CR>')

-- Insert
imap('<C-c>', '<Esc>')
imap('<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
imap('<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
-- imap('<CR>', 'v:lua.U.completion_confirm()', {expr = true})

-- Visual
xmap('<', '<gv')
xmap('>', '>gv')
xmap('K', ':move \'<-2<CR>gv-gv')
xmap('J', ':move \'>+1<CR>gv-gv')

-- Terminal
tmap('<C-w>h', '<cmd>wincmd h<CR>')
tmap('<C-w>j', '<cmd>wincmd j<CR>')
tmap('<C-w>k', '<cmd>wincmd k<CR>')
tmap('<C-w>l', '<cmd>wincmd l<CR>')
tmap('<C-w><C-h>', '<cmd>wincmd h<CR>')
tmap('<C-w><C-j>', '<cmd>wincmd j<CR>')
tmap('<C-w><C-k>', '<cmd>wincmd k<CR>')
tmap('<C-w><C-l>', '<cmd>wincmd l<CR>')

-- Command
cmap('<C-a>', '<Home>')
cmap('<C-e>', '<End>')
cmap('<C-f>', '<C-R>=expand("%:p")<CR>')

-- Git
nmap('<leader>gs', '<cmd>G<CR>')

-- Telescope
nmap('<C-p>', '<cmd>Telescope find_files hidden=true<CR>')
nmap('<C-o>', '<cmd>Telescope buffers<CR>')
nmap('<C-g>', '<cmd>Telescope live_grep<CR>')
nmap('<C-n>', '<cmd>Telescope file_browser hidden=true<CR>')

-- Tmree
-- nmap('<C-n>', '<cmd>NvimTreeToggle<CR>')

-- Vim surround ( noremap need to be false to work)
nmap('ds', '<Plug>Dsurround', {noremap = false})
nmap('cs', '<Plug>Csurround', {noremap = false})
nmap('cS', '<Plug>CSurround', {noremap = false})
nmap('s', '<Plug>Ysurround', {noremap = false})
nmap('S', '<Plug>YSurround', {noremap = false})
nmap('ss', '<Plug>Yssurround', {noremap = false})
nmap('SS', '<Plug>YSsurround', {noremap = false})
xmap('s', '<Plug>VSurround', {noremap = false})
xmap('S', '<Plug>VgSurround', {noremap = false})

vim.cmd [[command! PackerDelete :silent !rm  -rf ~/.local/share/nvim/site <CR>]]
vim.cmd [[command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor]]
