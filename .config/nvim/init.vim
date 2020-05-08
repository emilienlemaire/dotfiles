"""""""""""""""""""""""
"                     "
"     GENERAL         "
"                     "
"""""""""""""""""""""""

set nocompatible
filetype plugin indent on
syntax on

set autoindent
set expandtab
set softtabstop =4
set shiftwidth  =4
set shiftround

set backspace  =indent,eol,start
set hidden
set laststatus =2
set display    =lastline

set showmode
set showcmd

set incsearch
set hlsearch

set ttyfast
set lazyredraw

set splitbelow
set splitright

set cursorline
set wrapscan
set report     =0
set synmaxcol  =200

set relativenumber
set number

set list
if has('multi_byte') && &encoding ==# 'utf-8'
	let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
	let &listchar = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

if &shell =~# 'fish$'
	set shell=/bin/bash
endif

let mapleader=","

nnoremap <leader>rl :source ~/.config/nvim/init.vim<CR>

"""""REMAPPING"""""
map <leader>t :CommandT<CR>

call plug#begin(stdpath('data') . '/plugged')
Plug 'calincru/flex-bison-syntax'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'let-def/ocp-indent-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'roxma/nvim-yarp'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                                     "
"                    PLUGIN SETUP                                                     "
"                                                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""OCaml""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim/doc"
let g:merlin_python_version = 3

""""""""""""""""""""""""One dark""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme onedark

""""""""""""""""""""""""NerdTree""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

""""""""""""""""""""""""NerdCommenter"""""""""""""""""""""""""""""""""""""""""""""""""""
vmap ++ <plug>NERDCommenterToggle<CR>
nmap ++ <plug>NERDCommenterToggle<CR>

""""""""""""""""""""""""Python""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = "$HOME/anaconda3/envs/neovim2/bin/python"
let g:python3_host_prog = "$HOME/anaconda3/bin/python"

""""""""""""""""""""""""Coc.nvim""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

"Tab to trigger completion and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

"<c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

"Use <cr> to confirm completion
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"Navigate diagnostic
nmap <silent> <leader>i <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>k <Plug>(coc-diagnostic-next)

"GoTo navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Use K to show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

"Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

"Renaming
nmap <leader>rn <Plug>(coc-rename)

"Formating selected code
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)


augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


""""""""""""""LaTex live preview""""""""""""""""""""""""""""""
let g:livepreview_previewer = 'evince'


""""""""""""""Vim Airline""""""""""""""
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1

