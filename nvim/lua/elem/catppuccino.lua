local catppuccin = require('catppuccin')

catppuccin.setup({
  transparent_background = false,
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "undercurl",
        warnings = "undercurl",
        hints = "underline",
        information = "underline",
      },
    },
    lsp_trouble = true,
    -- lsp_saga = true,
    gitsigns = true,
    telescope = true,
    indent_blankline = {
      enabled = true,
      colored_indent_level = false
    },
    neogit = true,
  }
})
