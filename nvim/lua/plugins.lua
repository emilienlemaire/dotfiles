vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
  function(use)
    use {
      "cuducos/yaml.nvim",
      ft = {"yaml"}, -- optional
      requires = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim" -- optional
      },
      config = function ()
        require("yaml_nvim").init()
      end,
    }
    use '~/nvim-plugins/llvm-vim'

    use 'wbthomason/packer.nvim'
    --{{{ LSP
    use 'neovim/nvim-lspconfig'

    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'kdheepak/cmp-latex-symbols'
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

    use 'wbthomason/lsp-status.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'simrat39/rust-tools.nvim'
    use 'mfussenegger/nvim-dap'

    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'kitagry/vs-snippets'

    --}}}

    --{{{ UTILS
    use 'wellle/targets.vim'
    use {
      'rktjmp/hotpot.nvim',
      config = function()
              require("hotpot").setup({
                modules = {'zest'},
                macros = {
                  env = '_COMPILER'
          }
        })
      end
    }

    use {
      'tsbohc/zest.nvim',
      config = function()
        require('zest').setup()
      end
    }

    use {
      'vigoux/treesitter-context.nvim',
      requires = { 'nvim-treesitter/nvim-treesitter' }
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'}
      }
    }

    use 'nvim-telescope/telescope-fzy-native.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run='make'}

    use 'machakann/vim-sandwich'

    use 'pbrisbin/vim-mkdir'

    use 'mbbill/undotree'
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {
          search = {
            command = "rg",
            args = {
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "-g",
              "!vendor/*"
            },
          },
        }
      end
    }

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    -- use 'emilienlemaire/nvimux-navigator'

    use 'mhinz/vim-startify'
    use {
      'lervag/vimtex',
      ft = {'tex'}
    }

    use 'lewis6991/gitsigns.nvim'
    use 'TimUntersberger/neogit'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'onsails/lspkind-nvim'

    use 'GCBallesteros/jupytext.vim'
    use 'urbainvaes/vim-ripple'
    use {
      'GCBallesteros/vim-textobj-hydrogen',
      requires = {
        'kana/vim-textobj-user'
      }
    }

    use 'vimwiki/vimwiki'

    use 'b3nj5m1n/kommentary'

    use 'kevinhwang91/nvim-hlslens'
    --}}}

    -- {{{ LANGUAGES

    use 'ocaml/vim-ocaml'
    use 'paulpatault/virtual-types.nvim'
    use 'ELLIOTTCABLE/vim-menhir'
    use 'cdelledonne/vim-cmake'
    use 'tpope/vim-markdown'

    use 'tjdevries/nlua.nvim'
    use 'euclidianAce/BetterLua.vim'

    -- use 'tikhomirov/vim-glsl'

    -- use 'maelvls/gmpl.vim'

    if false then
      use 'jose-elias-alvarez/nvim-lsp-ts-utils'

      use 'leafgarland/typescript-vim'
      use 'yuezk/vim-js'
      use {'kristijanhusak/vim-js-file-import', run = 'npm install'}
      use 'peitalin/vim-jsx-typescript'
      use 'mlaursen/vim-react-snippets'
      use {'styled-components/vim-styled-components',  branch = 'main' }
      use 'neoclide/vim-jsx-improve'
    end

    use 'joelbeedle/pseudo-syntax'

    -- }}}

    -- {{{ COLORSCHEMES
    use 'catppuccin/nvim'

    use 'morhetz/gruvbox'

    use 'tjdevries/colorbuddy.vim'
    use 'tjdevries/express_line.nvim'

    use 'ryanoasis/vim-devicons'

    use 'kyazdani42/nvim-web-devicons'

    use {'Th3Whit3Wolf/one-nvim', opt = true}
    use 'joshdick/onedark.vim'

    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('indent_blankline').setup{
          char = "|",
          buftype_exclude = {'terminal'}
        }
      end
    }

    use 'lilydjwg/colorizer'

    -- }}}
  end,
  config =  {
    display = {
      _open_fn = function(name)
        -- Can only use plenary when we have our plugins.
        --  We can only get plenary when we don't have our plugins ;)
        local ok, float_win = pcall(function()
          return require('plenary.window.float').percentage_range_window(0.8, 0.8)
        end)

        if not ok then
          vim.cmd [[65vnew  [packer] ]]
          return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
        end

        local bufnr = float_win.buf
        local win = float_win.win

        vim.api.nvim_buf_set_name(bufnr, name)
        vim.api.nvim_win_set_option(win, 'winblend', 10)

        return win, bufnr
      end
    },
  }
})




