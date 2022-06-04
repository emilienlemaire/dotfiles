local filetypes = {
  yapl = "yapl",
  mli =  "ocaml_interface",
  mly =  "menhir",
  mll =  "ocamllex",
  lus =  "lus",
  mls =  "lus",
  imp =  "imp",
  rml =  "rml",
  thy =  "isabelle",
}

local opam_share = os.getenv("OPAM_SWITCH_PREFIX") .. "/share"

vim.api.nvim_create_augroup("ft", { clear = true })

for key, val in pairs(filetypes) do
  vim.api.nvim_create_autocmd(
    {"BufRead", "BufNewFile"},
    {
      group = "ft",
      pattern = key,
      command = "setfiletype ".. val,
    }
  )
end

vim.api.nvim_create_augroup("randomcmds", { clear = true})

vim.api.nvim_create_autocmd(
  "FileType",
  {
    group = "randomcmds",
    pattern = {
      "ocaml",
      "ocaml.ocaml_interface",
      "ocaml_interface",
      "menhir",
      "ocamllex",
    },
    command = "source " .. opam_share .. "/ocp-indent/vim/indent/ocaml.vim",
  }
)

local rs_callback = function ()
  local exts = require("lsp_extensions")
  exts.inlay_hints({
    prefix = ' » ',
    highlight = 'NonText',
    enabled = {'ChainingHint', 'TypeHint'}
  })
  require('elem.rust-tools')
end

vim.api.nvim_create_autocmd(
  "FileType",
  {
    group = "randomcmds",
    pattern = "rust",
    callback = rs_callback,
  }
)
