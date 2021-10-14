vim.g.ripple_repls = {
  rml = {
    command = "rmltop",
    post = ";;",
    addcr  = 1
  },
  python = {
    command = 'ipython',
  },
  ocaml = {
    command = "utop",
    pre = "",
    post = ";;",
    addcr = 1
  }
}
