" Vim syntax file
" Language: Impopt
" Adapte de pascal.vim de Mario Eusebio <bio@dq.fct.unl.pt>

syn clear

syn case ignore

syn keyword impStatement       return var putchar
syn keyword impConditional     if else while

syn keyword impTodo contained   TODO

syn match  impIdentifier        "\<[a-zA-Z_][a-zA-Z0-9_]*\>"

syn match  impDelimiter     "[({})]"

" syn match  impMatrixDelimiter "[][]"

"if you prefer you can highlight the range
"syn match  impMatrixDelimiter  "[[0-9]\+\.\.[0-9]\+]"

" Les notations numeriques sont recuperees de c.vim
syn match impNumber    "\<[0-9]\+\>"
"floating point number, with dot, optional exponent
syn match impFloat     "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\>"
"floating point number, starting with a dot, optional exponent
syn match impFloat     "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\>"
"floating point number, without dot, with exponent
syn match impFloat     "\<[0-9]\+e[-+]\=[0-9]\+\>"

" Les caracteres speciaux
syn match impOperator "[#+/*=><^]"
syn match impOperator ">="
syn match impOperator ">="
syn match impOperator "!="

syn region impComment   start="/\*"  end="\*/" contains=impTodo
syn region impComment   start="//"  end="\n" contains=impTodo

" Priorite des trucs qui commencent par -
syn match impOperator "-"

" Les mots-cles
syn keyword impConstant true false
syn keyword impFunction node function type const

syn sync lines=250

if !exists("did_imp_syntax_inits")
  let did_imp_syntax_inits = 1
  hi link impStatement      Statement
  hi link impConditional    Conditional
  hi link impTodo           Todo
  hi link impConstant       Number
  hi link impNumber         Number
  hi link impFloat          Number
  hi link impOperator       Operator
  hi link impFunction       Function
  hi link impType           Type
  hi link impComment        Comment
  hi link impStatement      Statement
  hi link impPack           Type
  hi link impDelimiter      Identifier

endif

let b:current_syntax = "imp"

" vim: ts=8
