local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

local ft_to_parser = require('nvim-treesitter.parsers').filetype_to_parsername

ft_to_parser.ocaml_interface = 'ocaml_interface'

parser_configs.yapl = {
  install_info = {
    url = "https://github.com/emilienlemaire/tree-sitter-yapl.git",
    files = {"src/parser.c"}
  },
  filetype = "yapl",
}

parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", 'src/scanner.cc' },
    branch = "main"
  },
}

parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = { "src/parser.c" },
    branch = "main"
  },
}

parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = { "src/parser.c" },
    branch = "main"
  },
}

parser_configs.menhir = {
  install_info = {
    url = "https://github.com/emilienlemaire/tree-sitter-menhir",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "menhir",
}

ft_to_parser.sage = 'python'

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },

  incremental_selection = {
    enable = true,
    keymaps = { -- mappings for incremental selection (visual mappings)
    init_selection = 'gnn',    -- maps in normal mode to init the node/scope selection
    node_incremental = 'gnn',  -- increment to the upper named parent
    scope_incremental = 'gns', -- increment to the upper scope (as defined in locals.scm)
    node_decremental = 'grm',  -- decrement to the previous node
    },
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["il"] = "@let.inner",
        ["al"] = "@let.outer",
        ["iP"] = "@begin.inner",
        ["aP"] = "@begin.outer",
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },

  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'json',
    'jsonc',
    'latex',
    'lua',
    'ocaml',
    'ocaml_interface',
    'ocamllex',
    'python',
    'toml',
    'yaml'
  },
  -- one of 'all', 'language', or a list of languages
}
