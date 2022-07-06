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
      pattern = "*." .. key,
      command = "setfiletype ".. val,
    }
  )
end

vim.api.nvim_create_augroup("randomcmds", { clear = true})

local ocaml_callback = function ()
  vim.cmd [[unlet b:did_indent]]
  vim.cmd ("source " .. opam_share .. "/ocp-indent/vim/indent/ocaml.vim")
end

vim.api.nvim_create_autocmd(
  "FileType",
  {
    group = "randomcmds",
    pattern = {
      "ocaml",
      "ocaml_interface",
      "menhir",
      "ocamllex",
    },
    callback = ocaml_callback,
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

vim.api.nvim_create_augroup("shiftwidth", { clear = true })

local shift_ft = {
    "ocaml",
    "lua",
    "ocaml_interface"
}

for _, ft in ipairs(shift_ft) do
    vim.api.nvim_create_autocmd(
      "FileType",
      {
        group = "shiftwidth",
        pattern = ft,
        command = "setlocal shiftwidth=2"
      }
    )
end
