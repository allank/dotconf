U.nvim_create_augroup({
  on_save = {
    {'BufWritePost', '*.vim,*.lua', 'source %'},
  },
  general = {
    {'TextYankPost', '*', 'silent! lua vim.highlight.on_yank { timeout = 150 }'},
    {'FileType', '*', 'set fo-=cro'}, -- Avoid newline continuation of comments
  },
})
