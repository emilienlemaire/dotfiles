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
set winfixwidth

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
set synmaxcol  =4000

set relativenumber
set number

set list

set undodir=~/.config/nvim/undo-dir
set undofile

set colorcolumn=100
set nowrap

set termguicolors

set clipboard=unnamed

if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
    let &listchar = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

if &shell =~# 'fish$'
    set shell=/bin/bash
endif

autocmd VimResized * :wincmd =

"""""REMAPPING"""""
let mapleader=","

nnoremap <leader>rl :source ~/.config/nvim/init.vim<CR>

nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

call plug#begin(stdpath('data') . '/plugged')
Plug 'cdelledonne/vim-cmake'
Plug 'dense-analysis/ale'
Plug 'emilienlemaire/nvimux-navigator'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'let-def/ocp-indent-vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'numirias/semshi', {'do': 'UpdateRemotePlugins'}
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vifm/vifm.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimlab/split-term.vim'
Plug 'vimwiki/vimwiki'
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'Yggdroot/indentLine'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                             "
"             PLUGIN SETUP                                                    "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""CommandT"""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>t :CommandT<CR>
if &term =~ "xterm" || &term =~ "screen"
    let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

set wildignore+=CMakeFiles,*/llvm/*,*/llvm-c/*,*/llvm-libs/*

""""""""""""""""""""""""OCaml""""""""""""""""""""""""""""""""""""""""""""""""""
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim/doc"
let g:merlin_python_version = 3

""""""""""""""""""""""""Colorscheme""""""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_constrast_dark = "hard"
augroup gbox
    autocmd!
    autocmd vimenter * colorscheme gruvbox
    autocmd vimenter * :AirlineRefresh
augroup end

""""""""""""""""""""""""NerdCommenter""""""""""""""""""""""""""""""""""""""""""
vmap ++ <plug>NERDCommenterToggle<CR>
nmap ++ <plug>NERDCommenterToggle<CR>

""""""""""""""""""""""""Python"""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = "$HOME/opt/anaconda3/envs/neovim2/bin/python"
let g:python3_host_prog = "$HOME/opt/anaconda3/bin/python"

""""""""""""""""""""""""Ruby""""""""""""""""""""""""
let g:ruby_host_prog = "/Users/emilienlemaire/.rvm/gems/ruby-2.7.0/bin/neovim-ruby-host"

""""""""""""""""""""""""Coc.nvim"""""""""""""""""""""""""""""""""""""""""""""""
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

" coc-clangd
nnoremap <silent> <leader>s :CocCommand clangd.switchSourceHeader<cr>

let g:coc_snippet_next = '<tab>'

""""""""""""""LaTex live preview"""""""""""""""""""""""""""""""""""""""""""""""
let g:livepreview_previewed = 'evince'

""""""""""""""Vim Airline""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="base16_gruvbox_dark_hard"
let g:airline_powerline_fonts=1

""""""""""""""Vifm"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vifm_embed_split = 1
nnoremap <silent> <C-n> :Vifm<cr>

""""""""""""""CMake""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:cmake_generate()
    if !exists(g:cmake_build_type)
endfunction

nnoremap <silent> <leader>b :CMakeBuild<cr>
nnoremap <silent> <leader>g :CMakeGenerate -DCMAKE_EXPORT_COMPILE_COMMANDS=1<cr>
nnoremap <silent> <leader>rs :CMakeClean<cr>

""""""""""""""ALE""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters_explicit = 1
let g:ale_linters = {
            \    'cpp': ['clangd']
            \}

let g:ale_fixers = {
            \   'cpp': ['clangd']
            \}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

""""""""""""""Undotree"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>u :UndotreeToggle<cr>

""""""""""""VimWiki""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType vimwiki nnoremap <buffer> <C-t> :VimwikiToggleListItem<cr>
