vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
  function(use, use_rocks)

    use "~/Development/plugins/ocaml-ts-queries.nvim"
    use {
      "~/Development/plugins/coqorico.nvim",
      rocks = {'xmlua'}
    }

    use_rocks {"xmlua"}

    use 'wbthomason/packer.nvim'

    --{{{ LSP
    -- use { 'neoclide/coc.nvim', run = 'yarn install --frozen-lockfile' }
    use 'neovim/nvim-lspconfig'

    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-context'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'kdheepak/cmp-latex-symbols'
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

    use 'ray-x/lsp_signature.nvim'

    use 'mfussenegger/nvim-dap'

    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'benfowler/telescope-luasnip.nvim'

    use 'nvim-lua/lsp_extensions.nvim'

    use 'j-hui/fidget.nvim'

    use 'jubnzv/virtual-types.nvim'

    --}}}

    --{{{ UTILS
    use 'rcarriga/nvim-notify'

    use 'wellle/targets.vim'

    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' }
      }
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
        require"telescope".load_extension("frecency")
      end,
      requires = {"tami5/sqlite.lua"}
    }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope-ui-select.nvim'

    use 'stevearc/dressing.nvim'

    use 'machakann/vim-sandwich'

    use 'junegunn/vim-easy-align'

    use 'pbrisbin/vim-mkdir'

    use 'jiaoshijie/undotree'

    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
    }

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }

    use 'mhinz/vim-startify'
    use 'sindrets/winshift.nvim'


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

    use 'numToStr/Comment.nvim'

    use 'kevinhwang91/nvim-hlslens'

    use 'akinsho/toggleterm.nvim'

    use 'godlygeek/tabular'
    --}}}

    -- {{{ LANGUAGES

    -- use 'ocaml/vim-ocaml'
    use 'jvoorhis/coq.vim'
    use 'bohlender/vim-smt2'
    use 'ashinkarov/nvim-agda'
    use 'whonore/Coqtail'

    use 'ELLIOTTCABLE/vim-menhir'
    use 'Shatur/neovim-cmake'
    use 'preservim/vim-markdown'
    use 'dhruvasagar/vim-table-mode'

    use 'simrat39/rust-tools.nvim'
    use 'tjdevries/nlua.nvim'
    use 'rafcamlet/nvim-luapad'
    use 'euclidianAce/BetterLua.vim'

    use 'Jorengarenar/COBOL.vim'

    use 'lervag/vimtex'

    use 'joelbeedle/pseudo-syntax'

    use "emilienlemaire/tree-sitter-menhir"

    use {
      "cuducos/yaml.nvim",
      ft = { "yaml" }, -- optional
      requires = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim" -- optional
      },
    }

    -- }}}

    -- {{{ COLORSCHEMES
    use {
      'catppuccin/nvim',
      as = 'catppuccin'
    }

    use 'yorik1984/newpaper.nvim'
    use 'Shatur/neovim-ayu'
    use 'sainnhe/edge'

    use 'yorik1984/lualine-theme.nvim'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'ryanoasis/vim-devicons'

    use 'kyazdani42/nvim-web-devicons'

    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('indent_blankline').setup {
          char = "|",
          buftype_exclude = { 'terminal' }
        }
      end
    }

    use 'lilydjwg/colorizer'

    -- }}}
  end,
  config = {
    max_jobs = 50, -- Noticed it bugged with more than 70 plugins
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
