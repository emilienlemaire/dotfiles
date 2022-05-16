-- {{ Vimtex
vim.g.tex_flavor = 'latex'
vim.g.vimtex_compiler_latexmk = {
  options = {
    '-shell-escape',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode'
  }
}
vim.g.vimtex_compiler_engine = "lualatex"
-- }}

-- {{ dap
vim.g.dap_virtual_text = true
-- }}

-- {{
--[[ vim.g.markdown_fenced_languages = {
  'plsql', 'sql', 'python', 'lua', 'cpp', 'typescript', 'typescriptreact', 'javascript', 'javascriptreact'
} ]]
vim.g.vim_markdown_folding_disabled = true
-- }}

-- {{ auto header
vim.g.header_field_author = 'Emilien Lemaire'
vim.g.header_field_author_email = 'emilien.lem@icloud.com'
vim.g.header_auto_add_header = false
-- }}

-- {{{ neoformat
vim.g.neoformat_ocaml_ocamlformat = {
  exe = 'ocamlformat',
  no_append = true,
  stdin = true,
  args = {
    '--disable-outside-detected-project',
    '--name',
    '"%:p"',
    '-'
  }
}
vim.g.neoformat_enabled_ocaml = {'ocamlformat'}
-- }}}

-- {{{ jupytext
vim.g.jupytext_fmt = 'py'
vim.g.jupytext_style = 'hydrogen'
-- }}}

-- {{{ vimwiki
--[[ vim.g.vimwiki_list = {
  {
    automatic_nested_syntax = true,
    template_path = "~/vimwiki_tpl",
    template_ext = ".tpl",
    template_default = "syntax-highlighted"
  }
} ]]
-- }}}

-- {{{ ripple
-- vim.g.ripple_winpos = "split"
-- }}}
