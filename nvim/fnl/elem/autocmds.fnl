(import-macros {:def-autocmd au-
                :def-augroup gr-} :zest.macros)

(gr- :tab-indent
  (au- :FileType
    [
      :ocaml
      :ocaml.ocaml_interface
      :menhir
      :ocamlex
      :lua
      :fennel
      :javascript
      :js
      :ts
      :tsx
      :typescript
      :typescriptreact
      :html
    ]
    ":setlocal shiftwidth=2"))

(gr- :ocaml-indent
  (au- :FileType
    [:ocaml :ocaml.ocaml_interface :menhir :ocamllex]
    ":source ~/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"))

(local fts {
    :md   "mkd"
    :yapl "yapl"
    :mli  "ocaml.ocaml_interface"
    :mly  "menhir"
    :mll  "ocamllex"
    :lus  "lus"
    :mls  "lus"
    :imp  "imp"
    :rml  "rml"
    :thy  "isabelle"
  })

(fn make_au [ext cmd]
  (au- [:BufRead :BufNewFile] ext
    cmd))

(gr- :extensions
  (each [ext ft (pairs fts)]
     (make_au (.. "*." ext) (.. ":setfiletype " ft))))

(au- [:BufEnter :BufWinEnter :TabEnter :BufWritePost] :*.rs ":lua require'lsp_extensions'.inlay_hints{prefix = ' » ', highlight = 'NonText', enabled = {'ChainingHint', 'TypeHint'}}")
