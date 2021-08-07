local actions = require 'telescope.actions'
local sorters = require 'telescope.sorters'

require('telescope').setup {
  defaults = {
    layout_strategy = 'horizontal',
    prompt_prefix = '❯ ',
    selection_caret = '❯ ',
    prompt_position = 'bottom',
    sorting_strategy = 'descending',
    file_sorter = sorters.get_fzy_sorter,
    mappings = {
      i = {['<C-j>'] = actions.move_selection_next, ['<C-k>'] = actions.move_selection_previous},
      n = {['<C-c>'] = actions.close},
    },
    file_ignore_patterns = {".git"},
  },
  extensions = {fzy_native = {override_generic_sorter = true, override_file_sorter = true}},
}

require('telescope').load_extension('fzy_native')

