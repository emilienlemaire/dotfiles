local catppuccin = require('catppuccin')
local mocha = require('catppuccin.palettes').get_palette('mocha')

vim.g.catppuccin_flavour = "mocha"

catppuccin.setup({
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin"
  },
  transparent_background = false,
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "undercurl" },
        warnings = { "undercurl" },
        hints = { "underline" },
        information = { "underline" },
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
  },
  highlight_overrides = {
    mocha = {
      TSNamespace = { fg = mocha.yellow, }
    },
  },
})
