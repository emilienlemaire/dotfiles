local opam_share = os.getenv("OPAM_SWITCH_PREFIX") .. "/share"

vim.api.nvim_create_augroup("randomcmds", { clear = true})

local ocaml_callback = function ()
  if vim.opt_local.filetype:get() == "ocaml" then
    vim.cmd [[unlet b:did_indent]]
  end
  vim.cmd ("source " .. opam_share .. "/ocp-indent/vim/indent/ocaml.vim")
  vim.opt.iskeyword:append("_")
end

vim.api.nvim_create_autocmd(
  "FileType",
  {
    group = "randomcmds",
    pattern = {
      "ocaml",
      "ocaml_interface",
    },
    callback = ocaml_callback,
  }
)


local rs_callback = function ()
  require('elem.rust-tools')
  local exts = require("lsp_extensions")
  exts.inlay_hints({
    prefix = ' » ',
    highlight = 'NonText',
    enabled = {'ChainingHint', 'TypeHint'}
  })
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
    "ocaml_interface",
    "ocamllex",
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

vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    group = "randomcmds",
    pattern = "*.rs",
    callback = function ()
      vim.lsp.buf.format()
    end
  }
)
