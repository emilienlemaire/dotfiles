local iron = require('iron')

iron.core.set_config {
  preferred = {
    python = 'ipython',
    ocaml = 'utop'
  },
  repl_open_cmd = [[vsplit]]
}
