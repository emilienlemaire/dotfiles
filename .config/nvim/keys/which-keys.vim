nnoremap <silent> <leader> :silent WhichKey '<Space>'<cr>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<cr>

let g:which_key_map = {}
let g:which_key_sep = '->'

highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ }

let g:which_key_map.r = {
            \ 'name' : '+prefix',
            \ 'l' : [':source ~/.config/nvim/init.vim'          , 'reload source'],
            \ 'n' : ['<Plug>(coc-rename)'                       , 'coc-rename'],
            \ 's' : [':CMakeClean'                              , 'Reset CMake']
            \}

let g:which_key_map.d = {
            \ 'name' : '+direction',
            \ 'n' : ['<Plug>(coc-diagnostic-next)'               , 'Next diagnostic'],
            \ 'p' : ['<Plug>(coc-diagnostic-prev)'               , 'Prev diagnostic']
            \}

let g:which_key_map.s = {
            \ 'name' : '+search',
            \ 'h' : [':CocCommand clangd.switchSourceHeader'     , 'Header'],
            \ 'f' : [':FZF'                                      , 'fzf'],
            \ 'r' : [':Rg'                                       ,  'rg']
            \}

let g:which_key_map.p = {
            \ 'name' : 'Plug',
            \ 'i' : [':PlugInstall'                              , 'Install'],
            \ 'c' : [':PlugClean'                                , 'Clean'],
            \ 'u' : [':PlugUpdate'                               , 'Update'],
            \ 'r' : [':PlugUpgrade'                              , 'Upgrade']
            \}

call which_key#register('<Space>', "g:which_key_map")
