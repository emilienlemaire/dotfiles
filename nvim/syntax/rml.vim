" Vim syntax file
" Language:     OCaml
" Filenames:    *.ml *.mli *.mll *.mly
" Maintainers:  Markus Mottl      <markus.mottl@gmail.com>
"               Karl-Heinz Sylla  <Karl-Heinz.Sylla@gmd.de>
"               Issac Trotts      <ijtrotts@ucdavis.edu>
" URL:          https://github.com/rml/vim-rml
" Last Change:
"               2018 Nov 08 - Improved highlighting of operators (Maëlan)
"               2018 Apr 22 - Improved support for PPX (Andrey Popp)
"               2018 Mar 16 - Remove raise, lnot and not from keywords (Étienne Millon, "copy")
"               2017 Apr 11 - Improved matching of negative numbers (MM)
"               2016 Mar 11 - Improved support for quoted strings (Glen Mével)
"               2015 Aug 13 - Allow apostrophes in identifiers (Jonathan Chan, Einar Lielmanis)
"               2015 Jun 17 - Added new "nonrec" keyword (MM)

" A minor patch was applied to the official version so that object/end
" can be distinguished from begin/end, which is used for indentation,
" and folding. (David Baelde)

" Quit when a syntax file was already loaded
if exists("b:current_syntax") && b:current_syntax == "rml"
  finish
endif

let s:keepcpo = &cpo
set cpo&vim

" ' can be used in OCaml identifiers
setlocal iskeyword+='

" ` is part of the name of polymorphic variants
setlocal iskeyword+=`

" OCaml is case sensitive.
syn case match

" Access to the method of an object
syn match    rmlMethod       "#"

" Script headers highlighted like comments
syn match    rmlComment   "^#!.*" contains=@Spell

" Scripting directives
syn match    rmlScript "^#\<\(quit\|labels\|warnings\|warn_error\|directory\|remove_directory\|cd\|load\|load_rec\|use\|mod_use\|install_printer\|remove_printer\|require\|list\|ppx\|principal\|predicates\|rectypes\|thread\|trace\|untrace\|untrace_all\|print_depth\|print_length\|camlp4o\|camlp4r\|topfind_log\|topfind_verbose|suspend|step|resume\)\>"

" lowercase identifier - the standard way to match
syn match    rmlLCIdentifier /\<\(\l\|_\)\(\w\|'\)*\>/

syn match    rmlKeyChar    "|"

" Errors
syn match    rmlBraceErr   "}"
syn match    rmlBrackErr   "\]"
syn match    rmlParenErr   ")"
syn match    rmlArrErr     "|]"

syn match    rmlCommentErr "\*)"

syn match    rmlCountErr   "\<downto\>"
syn match    rmlCountErr   "\<to\>"

if !exists("rml_revised")
  syn match    rmlDoErr      "\<do\>"
endif

syn match    rmlDoneErr    "\<done\>"
syn match    rmlThenErr    "\<then\>"

" Error-highlighting of "end" without synchronization:
" as keyword or as error (default)
if exists("rml_noend_error")
  syn match    rmlKeyword    "\<end\>"
else
  syn match    rmlEndErr     "\<end\>"
endif

" Some convenient clusters
syn cluster  rmlAllErrs contains=rmlBraceErr,rmlBrackErr,rmlParenErr,rmlCommentErr,rmlCountErr,rmlDoErr,rmlDoneErr,rmlEndErr,rmlThenErr

syn cluster  rmlAENoParen contains=rmlBraceErr,rmlBrackErr,rmlCommentErr,rmlCountErr,rmlDoErr,rmlDoneErr,rmlEndErr,rmlThenErr

syn cluster  rmlContained contains=rmlTodo,rmlPreDef,rmlModParam,rmlModParam1,rmlMPRestr,rmlMPRestr1,rmlMPRestr2,rmlMPRestr3,rmlModRHS,rmlFuncWith,rmlFuncStruct,rmlModTypeRestr,rmlModTRWith,rmlWith,rmlWithRest,rmlModType,rmlFullMod,rmlVal


" Enclosing delimiters
syn region   rmlEncl transparent matchgroup=rmlKeywordDelimiter start="(" matchgroup=rmlKeywordDelimiter end=")" contains=ALLBUT,@rmlContained,rmlParenErr
syn region   rmlEncl transparent matchgroup=rmlKeywordDelimiter start="{" matchgroup=rmlKeywordDelimiter end="}"  contains=ALLBUT,@rmlContained,rmlBraceErr
syn region   rmlEncl transparent matchgroup=rmlKeywordDelimiter start="\[" matchgroup=rmlKeywordDelimiter end="\]" contains=ALLBUT,@rmlContained,rmlBrackErr
syn region   rmlEncl transparent matchgroup=rmlKeywordDelimiter start="\[|" matchgroup=rmlKeywordDelimiter end="|\]" contains=ALLBUT,@rmlContained,rmlArrErr


" Comments
syn region   rmlComment start="(\*" end="\*)" contains=@Spell,rmlComment,rmlTodo
syn keyword  rmlTodo contained TODO FIXME XXX NOTE


" Objects
syn region   rmlEnd matchgroup=rmlObject start="\<object\>" matchgroup=rmlObject end="\<end\>" contains=ALLBUT,@rmlContained,rmlEndErr


" Blocks
if !exists("rml_revised")
  syn region   rmlEnd matchgroup=rmlKeyword start="\<begin\>" matchgroup=rmlKeyword end="\<end\>" contains=ALLBUT,@rmlContained,rmlEndErr
endif


" "for"
syn region   rmlNone matchgroup=rmlKeyword start="\<for\>" matchgroup=rmlKeyword end="\<\(to\|downto\)\>" contains=ALLBUT,@rmlContained,rmlCountErr

" "do"
if !exists("rml_revised")
  syn region   rmlDo matchgroup=rmlKeyword start="\<do\>" matchgroup=rmlKeyword end="\<done\>" contains=ALLBUT,@rmlContained,rmlDoneErr
endif

" "if"
syn region   rmlNone matchgroup=rmlKeyword start="\<if\>" matchgroup=rmlKeyword end="\<then\>" contains=ALLBUT,@rmlContained,rmlThenErr

"" PPX nodes

syn match rmlPpxIdentifier /\(\[@\{1,3\}\)\@<=\w\+\(\.\w\+\)*/
syn region rmlPpx matchgroup=rmlPpxEncl start="\[@\{1,3\}" contains=TOP end="\]"

"" Modules

" "sig"
syn region   rmlSig matchgroup=rmlSigEncl start="\<sig\>" matchgroup=rmlSigEncl end="\<end\>" contains=ALLBUT,@rmlContained,rmlEndErr,rmlModule
syn region   rmlModSpec matchgroup=rmlKeyword start="\<module\>" matchgroup=rmlModule end="\<\u\(\w\|'\)*\>" contained contains=@rmlAllErrs,rmlComment skipwhite skipempty nextgroup=rmlModTRWith,rmlMPRestr

" "open"
syn match   rmlKeyword "\<open\>" skipwhite skipempty nextgroup=rmlFullMod

" "include"
syn match    rmlKeyword "\<include\>" skipwhite skipempty nextgroup=rmlModParam,rmlFullMod

" "module" - somewhat complicated stuff ;-)
syn region   rmlModule matchgroup=rmlKeyword start="\<module\>" matchgroup=rmlModule end="\<\u\(\w\|'\)*\>" contains=@rmlAllErrs,rmlComment skipwhite skipempty nextgroup=rmlPreDef
syn region   rmlPreDef start="."me=e-1 matchgroup=rmlKeyword end="\l\|=\|)"me=e-1 contained contains=@rmlAllErrs,rmlComment,rmlModParam,rmlGenMod,rmlModTypeRestr,rmlModTRWith nextgroup=rmlModPreRHS
syn region   rmlModParam start="([^*]" end=")" contained contains=rmlGenMod,rmlModParam1,rmlSig,rmlVal
syn match    rmlModParam1 "\<\u\(\w\|'\)*\>" contained skipwhite skipempty
syn match    rmlGenMod "()" contained skipwhite skipempty

syn region   rmlMPRestr start=":" end="."me=e-1 contained contains=@rmlComment skipwhite skipempty nextgroup=rmlMPRestr1,rmlMPRestr2,rmlMPRestr3
syn region   rmlMPRestr1 matchgroup=rmlSigEncl start="\ssig\s\=" matchgroup=rmlSigEncl end="\<end\>" contained contains=ALLBUT,@rmlContained,rmlEndErr,rmlModule
syn region   rmlMPRestr2 start="\sfunctor\(\s\|(\)\="me=e-1 matchgroup=rmlKeyword end="->" contained contains=@rmlAllErrs,rmlComment,rmlModParam,rmlGenMod skipwhite skipempty nextgroup=rmlFuncWith,rmlMPRestr2
syn match    rmlMPRestr3 "\w\(\w\|'\)*\( *\. *\w\(\w\|'\)*\)*" contained
syn match    rmlModPreRHS "=" contained skipwhite skipempty nextgroup=rmlModParam,rmlFullMod
syn keyword  rmlKeyword val
syn region   rmlVal matchgroup=rmlKeyword start="\<val\>" matchgroup=rmlLCIdentifier end="\<\l\(\w\|'\)*\>" contains=@rmlAllErrs,rmlComment,rmlFullMod skipwhite skipempty nextgroup=rmlMPRestr
syn region   rmlModRHS start="." end=". *\w\|([^*]"me=e-2 contained contains=rmlComment skipwhite skipempty nextgroup=rmlModParam,rmlFullMod
syn match    rmlFullMod "\<\u\(\w\|'\)*\( *\. *\u\(\w\|'\)*\)*" contained skipwhite skipempty nextgroup=rmlFuncWith

syn region   rmlFuncWith start="([^*)]"me=e-1 end=")" contained contains=rmlComment,rmlWith,rmlFuncStruct skipwhite skipempty nextgroup=rmlFuncWith
syn region   rmlFuncStruct matchgroup=rmlStructEncl start="[^a-zA-Z]struct\>"hs=s+1 matchgroup=rmlStructEncl end="\<end\>" contains=ALLBUT,@rmlContained,rmlEndErr

syn match    rmlModTypeRestr "\<\w\(\w\|'\)*\( *\. *\w\(\w\|'\)*\)*\>" contained
syn region   rmlModTRWith start=":\s*("hs=s+1 end=")" contained contains=@rmlAENoParen,rmlWith
syn match    rmlWith "\<\(\u\(\w\|'\)* *\. *\)*\w\(\w\|'\)*\>" contained skipwhite skipempty nextgroup=rmlWithRest
syn region   rmlWithRest start="[^)]" end=")"me=e-1 contained contains=ALLBUT,@rmlContained

" "struct"
syn region   rmlStruct matchgroup=rmlStructEncl start="\<\(module\s\+\)\=struct\>" matchgroup=rmlStructEncl end="\<end\>" contains=ALLBUT,@rmlContained,rmlEndErr

" "module type"
syn region   rmlKeyword start="\<module\>\s*\<type\>\(\s*\<of\>\)\=" matchgroup=rmlModule end="\<\w\(\w\|'\)*\>" contains=rmlComment skipwhite skipempty nextgroup=rmlMTDef
syn match    rmlMTDef "=\s*\w\(\w\|'\)*\>"hs=s+1,me=s+1 skipwhite skipempty nextgroup=rmlFullMod

" Quoted strings
syn region rmlString matchgroup=rmlQuotedStringDelim start="{\z\([a-z_]*\)|" end="|\z1}" contains=@Spell

syn keyword  rmlKeyword  and as assert class
syn keyword  rmlKeyword  constraint else
syn keyword  rmlKeyword  exception external fun

syn keyword  rmlKeyword  in inherit initializer
syn keyword  rmlKeyword  lazy let match
syn keyword  rmlKeyword  method mutable new nonrec of
syn keyword  rmlKeyword  parser private rec
syn keyword  rmlKeyword  try type
syn keyword  rmlKeyword  virtual when while with
syn keyword  rmlKeyword  loop run pause 

if exists("rml_revised")
  syn keyword  rmlKeyword  do value
  syn keyword  rmlBoolean  True False
else
  syn keyword  rmlKeyword  function
  syn keyword  rmlBoolean  true false
endif

syn keyword  rmlType     array bool char exn float format format4
syn keyword  rmlType     int int32 int64 lazy_t list nativeint option
syn keyword  rmlType     bytes string unit

syn match    rmlConstructorDelimiter  "(\s*)"
syn match    rmlConstructorDelimiter  "\[\s*\]"
syn match    rmlConstructorDelimiter  "\[|\s*>|]"
syn match    rmlConstructorDelimiter  "\[<\s*>\]"
syn match    rmlConstructor  "\u\(\w\|'\)*\>"

" Polymorphic variants
syn match    rmlConstructor  "`\w\(\w\|'\)*\>"

" Module prefix
syn match    rmlModPath      "\u\(\w\|'\)* *\."he=e-1

syn match    rmlCharacter    "'\\\d\d\d'\|'\\[\'ntbr]'\|'.'"
syn match    rmlCharacter    "'\\x\x\x'"
syn match    rmlCharErr      "'\\\d\d'\|'\\\d'"
syn match    rmlCharErr      "'\\[^\'ntbr]'"
syn region   rmlString       start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell

syn match    rmlTopStop      ";;"

syn match    rmlAnyVar       "\<_\>"
syn match    rmlKeyChar      "|[^\]]"me=e-1
syn match    rmlKeyChar      ";"
syn match    rmlKeyChar      "\~"
syn match    rmlKeyChar      "?"

"" Operators

" The grammar of operators is found there:
"     https://caml.inria.fr/pub/docs/manual-rml/names.html#operator-name
"     https://caml.inria.fr/pub/docs/manual-rml/extn.html#s:ext-ops
"     https://caml.inria.fr/pub/docs/manual-rml/extn.html#s:index-operators
" =, *, < and > are both operator names and keywords, we let the user choose how
" to display them (has to be declared before regular infix operators):
syn match    rmlEqual        "="
syn match    rmlStar         "*"
syn match    rmlAngle        "<"
syn match    rmlAngle        ">"
" Custom indexing operators:
syn region   rmlIndexing matchgroup=rmlIndexingOp
  \ start="\.[~?!:|&$%=>@^/*+-][~?!.:|&$%<=>@^*/+-]*\_s*("
  \ end=")\(\_s*<-\)\?"
  \ contains=ALLBUT,@rmlContained,rmlParenErr
syn region   rmlIndexing matchgroup=rmlIndexingOp
  \ start="\.[~?!:|&$%=>@^/*+-][~?!.:|&$%<=>@^*/+-]*\_s*\["
  \ end="]\(\_s*<-\)\?"
  \ contains=ALLBUT,@rmlContained,rmlBrackErr
syn region   rmlIndexing matchgroup=rmlIndexingOp
  \ start="\.[~?!:|&$%=>@^/*+-][~?!.:|&$%<=>@^*/+-]*\_s*{"
  \ end="}\(\_s*<-\)\?"
  \ contains=ALLBUT,@rmlContained,rmlBraceErr
" Extension operators (has to be declared before regular infix operators):
syn match    rmlExtensionOp          "#[#~?!.:|&$%<=>@^*/+-]\+"
" Infix and prefix operators:
syn match    rmlPrefixOp              "![~?!.:|&$%<=>@^*/+-]*"
syn match    rmlPrefixOp           "[~?][~?!.:|&$%<=>@^*/+-]\+"
syn match    rmlInfixOp      "[&$%@^/+-][~?!.:|&$%<=>@^*/+-]*"
syn match    rmlInfixOp         "[|<=>*][~?!.:|&$%<=>@^*/+-]\+"
syn match    rmlInfixOp               "#[~?!.:|&$%<=>@^*/+-]\+#\@!"
syn match    rmlInfixOp              "!=[~?!.:|&$%<=>@^*/+-]\@!"
syn keyword  rmlInfixOpKeyword      asr land lor lsl lsr lxor mod or
" := is technically an infix operator, but we may want to show it as a keyword
" (somewhat analogously to = for let‐bindings and <- for assignations):
syn match    rmlRefAssign    ":="
" :: is technically not an operator, but we may want to show it as such:
syn match    rmlCons         "::"
" -> and <- are keywords, not operators (but can appear in longer operators):
syn match    rmlArrow        "->[~?!.:|&$%<=>@^*/+-]\@!"
if exists("rml_revised")
  syn match    rmlErr        "<-[~?!.:|&$%<=>@^*/+-]\@!"
else
  syn match    rmlKeyChar    "<-[~?!.:|&$%<=>@^*/+-]\@!"
endif

syn match    rmlNumber        "-\=\<\d\(_\|\d\)*[l|L|n]\?\>"
syn match    rmlNumber        "-\=\<0[x|X]\(\x\|_\)\+[l|L|n]\?\>"
syn match    rmlNumber        "-\=\<0[o|O]\(\o\|_\)\+[l|L|n]\?\>"
syn match    rmlNumber        "-\=\<0[b|B]\([01]\|_\)\+[l|L|n]\?\>"
syn match    rmlFloat         "-\=\<\d\(_\|\d\)*\.\?\(_\|\d\)*\([eE][-+]\=\d\(_\|\d\)*\)\=\>"

" Labels
syn match    rmlLabel        "\~\(\l\|_\)\(\w\|'\)*"lc=1
syn match    rmlLabel        "?\(\l\|_\)\(\w\|'\)*"lc=1
syn region   rmlLabel transparent matchgroup=rmlLabel start="[~?](\(\l\|_\)\(\w\|'\)*"lc=2 end=")"me=e-1 contains=ALLBUT,@rmlContained,rmlParenErr


" Synchronization
syn sync minlines=50
syn sync maxlines=500

if !exists("rml_revised")
  syn sync match rmlDoSync      grouphere  rmlDo      "\<do\>"
  syn sync match rmlDoSync      groupthere rmlDo      "\<done\>"
endif

if exists("rml_revised")
  syn sync match rmlEndSync     grouphere  rmlEnd     "\<\(object\)\>"
else
  syn sync match rmlEndSync     grouphere  rmlEnd     "\<\(begin\|object\)\>"
endif

syn sync match rmlEndSync     groupthere rmlEnd     "\<end\>"
syn sync match rmlStructSync  grouphere  rmlStruct  "\<struct\>"
syn sync match rmlStructSync  groupthere rmlStruct  "\<end\>"
syn sync match rmlSigSync     grouphere  rmlSig     "\<sig\>"
syn sync match rmlSigSync     groupthere rmlSig     "\<end\>"

" Define the default highlighting.

hi def link rmlBraceErr	   Error
hi def link rmlBrackErr	   Error
hi def link rmlParenErr	   Error
hi def link rmlArrErr	   Error

hi def link rmlCommentErr   Error

hi def link rmlCountErr	   Error
hi def link rmlDoErr	   Error
hi def link rmlDoneErr	   Error
hi def link rmlEndErr	   Error
hi def link rmlThenErr	   Error

hi def link rmlCharErr	   Error

hi def link rmlErr	   Error

hi def link rmlComment	   Comment

hi def link rmlModPath	   Include
hi def link rmlObject	   Include
hi def link rmlModule	   Include
hi def link rmlModParam1    Include
hi def link rmlGenMod       Include
hi def link rmlModType	   Include
hi def link rmlMPRestr3	   Include
hi def link rmlFullMod	   Include
hi def link rmlFuncWith	   Include
hi def link rmlModParam     Include
hi def link rmlModTypeRestr Include
hi def link rmlWith	   Include
hi def link rmlMTDef	   Include
hi def link rmlSigEncl	   rmlModule
hi def link rmlStructEncl	   rmlModule

hi def link rmlScript	   Include

hi def link rmlConstructor  Constant
hi def link rmlConstructorDelimiter  rmlConstructor

hi def link rmlVal          Keyword
hi def link rmlModPreRHS    Keyword
hi def link rmlMPRestr2	   Keyword
hi def link rmlKeyword	   Keyword
hi def link rmlKeywordDelimiter	   rmlKeyword
hi def link rmlMethod	   Include
hi def link rmlArrow	   Keyword
hi def link rmlKeyChar	   Keyword
hi def link rmlAnyVar	   Keyword
hi def link rmlTopStop	   Keyword

hi def link rmlRefAssign    rmlKeyChar
hi def link rmlEqual        rmlKeyChar
hi def link rmlStar         rmlInfixOp
hi def link rmlAngle        rmlInfixOp
hi def link rmlCons         rmlInfixOp

hi def link rmlPrefixOp       rmlOperator
hi def link rmlInfixOp        rmlOperator
hi def link rmlExtensionOp    rmlOperator
hi def link rmlIndexingOp     rmlOperator

if exists("rml_highlight_operators")
    hi def link rmlInfixOpKeyword rmlOperator
    hi def link rmlOperator       Operator
else
    hi def link rmlInfixOpKeyword Keyword
endif

hi def link rmlBoolean	   Boolean
hi def link rmlCharacter    Character
hi def link rmlNumber	   Number
hi def link rmlFloat	   Float
hi def link rmlString	   String
hi def link rmlQuotedStringDelim Identifier

hi def link rmlLabel	   Identifier

hi def link rmlType	   Type

hi def link rmlTodo	   Todo

hi def link rmlEncl	   Keyword

hi def link rmlPpxEncl       rmlEncl

let b:current_syntax = "rml"

let &cpo = s:keepcpo
unlet s:keepcpo

" vim: ts=8
