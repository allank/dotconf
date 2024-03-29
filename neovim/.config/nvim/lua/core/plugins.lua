local packer_path = U.os.data .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_path)
end
vim.cmd 'packadd packer.nvim | au BufWritePost plugins.lua PackerCompile'
vim.opt.rtp = vim.opt.rtp + '~/.local/share/nvim/site/pack/packer/opt/*'

local packer = require('packer')
local plugin_path = U.os.data .. '/site/pack/packer/opt/'
local packer_compiled = U.os.data .. '/site/plugin/packer_compiled.vim'

return packer.startup(function(use)
  packer.init({compile_path = packer_compiled, opt_default = true})

  -- Plugin Manager
  use 'wbthomason/packer.nvim'
  -- Colorschemes
  use {
    'ChristianChiarulli/nvcode-color-schemes.vim', 
  }
  -- Comments
  use 'tpope/vim-commentary'
  -- File explorer
  -- use {'kyazdani42/nvim-tree.lua', setup = [[require('plugin.nvim-tree')]]}
  -- Git
  use 'tpope/vim-fugitive'
  use {'lewis6991/gitsigns.nvim', setup = [[require('plugin.gitsigns')]]}
  -- Icons
  use {'kyazdani42/nvim-web-devicons', setup = [[require('plugin.nvim-web-devicons')]]}
  -- Indentline
  use {
    'lukas-reineke/indent-blankline.nvim',
    setup = [[require('plugin.indent-blankline')]],
  }
  -- Lsp
  -- use {
  --   'neovim/nvim-lspconfig',
  --   setup = [[require('plugin.nvim-lspconfig')]],
  --   requires = {
  --     {'hrsh7th/nvim-compe', setup = [[require('plugin.nvim-compe')]], event = 'InsertEnter'},
  --     'kabouzeid/nvim-lspinstall', 'glepnir/lspsaga.nvim', 'jose-elias-alvarez/nvim-lsp-ts-utils',
  --   },
  -- }
  -- Surround
  use 'tpope/vim-surround'
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    setup = [[require('plugin.telescope')]],
    requires = {
      'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzy-native.nvim',
    },
  }
  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    setup = [[require('plugin.nvim-treesitter')]],
    requires = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      'p00f/nvim-ts-rainbow', 'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  }

  -- use 'lervag/vimtex'

  -- Autoinstall/compile plugins
  if vim.fn.isdirectory(vim.fn.glob(plugin_path)) > 0 then packer.install() end
  if vim.fn.empty(vim.fn.glob(packer_compiled)) > 0 then packer.compile() end
end)
