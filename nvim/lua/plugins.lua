require('lazy').setup({
  {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require('colorizer').setup()
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = require'elem.catppuccin'.config,
  },

  'tpope/vim-sleuth',

  { 'numToStr/Comment.nvim', opts = {} },

  { 'lewis6991/gitsigns.nvim', opts = {} },

  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = require'elem.telescope'.config,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },

    config = require'elem.lsp'.config,
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function ()
              require'luasnip.loaders.from_vscode'.lazy_load()
            end
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = require'elem.nvim-cmp'.config
  },

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    opts = {}
  },

  {
    'echasnovski/mini.nvim',
    version = false,
    config = require'elem.mini'.config
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  { 'tjdevries/ocaml.nvim',
    build = ':lua require("ocaml").update()'
  }

  -- TODO: treesitter-context, treesitter-textobjexts
})

