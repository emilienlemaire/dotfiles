vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
  function(use)

    -- use "~/Development/lua/cmake.nvim"
    use "emilienlemaire/tree-sitter-menhir"

    use {
      "cuducos/yaml.nvim",
      ft = {"yaml"}, -- optional
      requires = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim" -- optional
      },
    }

    use {
      "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
      event = "TermOpen",
      requires = {
        "akinsho/nvim-toggleterm.lua",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("telescope").load_extension "toggleterm"
      end,
    }

    -- use '~/nvim-plugins/llvm-vim'

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
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    use 'saadparwaiz1/cmp_luasnip'
    -- use 'hrsh7th/cmp-vsnip'
    use 'kdheepak/cmp-latex-symbols'
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

    use 'wbthomason/lsp-status.nvim'
    use 'ray-x/lsp_signature.nvim'
    -- use 'simrat39/rust-tools.nvim'
    use 'mfussenegger/nvim-dap'

    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'benfowler/telescope-luasnip.nvim'

    use 'nvim-lua/lsp_extensions.nvim'

    use'j-hui/fidget.nvim'
    --}}}

    --{{{ UTILS
    use 'wellle/targets.vim'
    use {
      'rktjmp/hotpot.nvim',
      config = function()
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
    use 'junegunn/vim-easy-align'

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
-- #2B2B2B
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

    use {
      'nvim-neorg/neorg',
      config = function()
        require('neorg').setup {
          load = {
            ["core.defaults"] = {}, -- Load all the default modules
            ["core.keybinds"] = { -- Configure core.keybinds
              config = {
                default_keybinds = true, -- Generate the default keybinds
                neorg_leader = "<Leader>o" -- This is the default if unspecified
              }
            },
            ["core.norg.concealer"] = {
              config = {}
            }, -- Allows for use of icons
            ["core.norg.dirman"] = { -- Manage your directories with Neorg
              config = {
                workspaces = {
                  my_workspace = "~/neorg"
                }
              }
            }
          },
        }
      end,
      requires = 'nvim-lua/plenary.nvim',
    }

    use 'b3nj5m1n/kommentary'

    use 'kevinhwang91/nvim-hlslens'

    use 'akinsho/toggleterm.nvim'
    --}}}

    -- {{{ LANGUAGES

    use 'ocaml/vim-ocaml'
    use 'jubnzv/virtual-types.nvim'
    use 'ELLIOTTCABLE/vim-menhir'
    use 'cdelledonne/vim-cmake'
    -- use 'tpope/vim-markdown'
    use 'godlygeek/tabular'
    use 'preservim/vim-markdown'
    use 'dhruvasagar/vim-table-mode'

    use 'tjdevries/nlua.nvim'
    use 'rafcamlet/nvim-luapad'
    use 'euclidianAce/BetterLua.vim'

    use 'Jorengarenar/COBOL.vim'

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
    use {
        'catppuccin/nvim',
        as = 'catppuccin'
    }

    use 'yorik1984/newpaper.nvim'

    use 'yorik1984/lualine-theme.nvim'
    -- use 'tjdevries/express_line.nvim'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

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
    max_jobs = 70, -- Noticed it bugged with more than 70 plugins
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




