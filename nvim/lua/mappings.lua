local utils = require('utils')

local options = {
  noremap = true,
  silent = true
}

--{{{ genarals
utils.map_lua('n', '<leader>rl', [[require'utils'.reload_plugins()]], options)
utils.map('t', '<c-h>', '<c-\\><c-n>:wincmd h<cr>', options)
utils.map('t', '<c-j>', '<c-\\><c-n>:wincmd j<cr>', options)
utils.map('t', '<c-k>', '<c-\\><c-n>:wincmd k<cr>', options)
utils.map('t', '<c-l>', '<c-\\><c-n>:wincmd l<cr>', options)
utils.map('n', '<c-h>', ':wincmd h<cr>', options)
utils.map('n', '<c-j>', ':wincmd j<cr>', options)
utils.map('n', '<c-k>', ':wincmd k<cr>', options)
utils.map('n', '<c-l>', ':wincmd l<cr>', options)
--}}}

--{{{ cmake
utils.map('n', '<leader>b', ':CMakeBuild<cr>', options)
utils.map('n', '<leader>g', ':CMakeGenerate -DCMAKE_EXPORT_COMPILE_COMMANDS=1 <cr>', options)
--}}}

-- {{{ vsnip
utils.map('i', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']], {expr = true})
utils.map('s', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']], {expr = true})

utils.map('i', '<C-j>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']], {expr = true})
utils.map('s', '<C-j>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']], {expr = true})

-- }}}

-- {{{ diagnostics
utils.map_lua('n', '<leader>dn', [[vim.diagnostic.goto_next()]], options)
utils.map_lua('n', '<leader>dp', [[vim.diagnostic.goto_prev()]], options)
-- }}}

-- {{{ EasyAlign
utils.map('x', 'ga', '<Plug>(EasyAlign)')
utils.map('n', 'ga', '<Plug>(EasyAlign)')
-- }}}

-- {{{ Floaterm
utils.map('n', '<leader>tg', ':FloatermNew lazygit<cr>', options)
-- }}}

-- {{{ lsp
-- }}}

-- {{{ telescope
utils.map_lua('n', '<leader>sf', [[require'elem.telescope'.git_files{}]], options)
utils.map_lua('n', '<leader>p', [[require'telescope.builtin'.find_files{}]], options)
utils.map_lua('n', '<leader>rg', [[require'telescope.builtin'.live_grep{}]], options)
utils.map_lua('n', '<leader>ls', [[require'telescope.builtin'.lsp_references{}]], options)
utils.map_lua('n', '<leader>ws', [[require'telescope.builtin'.lsp_workspace_symbols{}]], options)
utils.map_lua('n', '<leader>ds', [[require'telescope.builtin'.lsp_document_symbols{}]], options)
utils.map_lua('n', '<leader>dg', [[require'telescope.builtin'.lsp_document_diagnostics{}]], options)
utils.map_lua('n', '<leader>wg', [[require'telescope.builtin'.lsp_workspace_diagnostics{}]], options)
utils.map_lua('n', '<leader>ld', [[require'telescope.builtin'.lsp_definition{}]], options)
utils.map_lua('n', '<leader>ec', [[require'elem.telescope'.edit_config{}]], options)
utils.map_lua('n', '<leader>ff', [[require'elem.telescope'.curbuf{}]], options)
-- }}}
--
-- {{{ dap
utils.map_lua('n', '<F5>', [[require'elem.dap'.start_c_debugger()]], options)
utils.map_lua('n', '<F10>', [[require'dap'.step_over()]], options)
utils.map_lua('n', '<F11>', [[require'dap'.step_into()]], options)
utils.map_lua('n', '<F12>', [[require'dap'.step_out()]], options)
utils.map_lua('n', '<F9>', [[require'dap'.toggle_breakpoint()]], options)
utils.map_lua('n', '<leader>dr', [[require'dap'.repl.open()]], options)
utils.map_lua('n', '<leader>dl', [[require'dap'.run_last()]], options)
-- }}}

-- {{{ lspsaga
-- }}}

-- {{{ iron.nvim
utils.map('n', ']x', "yrih", {silent = true})
-- }}}
--
-- {{{ lsptrouble
utils.map('n', '<leader>tt', '<cmd>TroubleToggle<cr>', options)
utils.map('n', '<leader>tw', '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', options)
utils.map('n', '<leader>td', '<cmd>TroubleToggle lsp_document_diagnostics<cr>', options)
-- }}}
-- {{{
utils.map_lua('n', '<leader>rr', [[require('rust-tools.runnables').runnables()]], options)
-- }}}
