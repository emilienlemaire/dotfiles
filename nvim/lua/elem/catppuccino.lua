local catppuccino = require('catppuccino')
local cat_api = require('catppuccino.api.colors')
local err, colors = cat_api.get_colors("dark_catppuccino")

catppuccino.setup({
  colorscheme = "dark_catppuccino",
  transparency = true,
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
    lsp_saga = true,
    gitsigns = true,
    telescope = true
  }
})
