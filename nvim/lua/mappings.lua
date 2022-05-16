local options = {
  noremap = true,
  silent = true
}

--{{{ genarals
vim.keymap.set('n', '<leader>rl', require'utils'.reload_plugins, options)
vim.keymap.set('t', '<c-h>', '<c-\\><c-n>:wincmd h<cr>', options)
vim.keymap.set('t', '<c-j>', '<c-\\><c-n>:wincmd j<cr>', options)
vim.keymap.set('t', '<c-k>', '<c-\\><c-n>:wincmd k<cr>', options)
vim.keymap.set('t', '<c-l>', '<c-\\><c-n>:wincmd l<cr>', options)
vim.keymap.set('t', '<esc>', '<c-\\><c-n>', options)
vim.keymap.set('n', '<c-h>', ':wincmd h<cr>', options)
vim.keymap.set('n', '<c-j>', ':wincmd j<cr>', options)
vim.keymap.set('n', '<c-k>', ':wincmd k<cr>', options)
vim.keymap.set('n', '<c-l>', ':wincmd l<cr>', options)
--}}}

--{{{ cmake
vim.keymap.set('n', '<leader>cb', ':CMakeBuild<cr>', options)
vim.keymap.set('n', '<leader>cg', ':CMakeGenerate -DCMAKE_EXPORT_COMPILE_COMMANDS=1 <cr>', options)
--}}}

-- {{{ diagnostics
vim.keymap.set('n', '<leader>dn', function () vim.diagnostic.goto_next({float = {border = "rounded"}}) end, options)
vim.keymap.set('n', '<leader>dp', function () vim.diagnostic.goto_prev({float = {border = "rounded"}}) end, options)
-- }}}

-- {{{ EasyAlign
vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)')
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')
-- }}}

-- {{{ telescope
vim.keymap.set('n', '<leader>o', require'elem.telescope'.git_files, options)
vim.keymap.set('n', '<leader>p', require'telescope.builtin'.find_files, options)
vim.keymap.set('n', '<leader>rg', require'telescope.builtin'.live_grep, options)
vim.keymap.set('n', '<leader>ls', require'telescope.builtin'.lsp_references, options)
vim.keymap.set('n', '<leader>ws', require'telescope.builtin'.lsp_workspace_symbols, options)
vim.keymap.set('n', '<leader>ds', require'telescope.builtin'.lsp_document_symbols, options)
vim.keymap.set('n', '<leader>dg', require'telescope.builtin'.diagnostics, options)
vim.keymap.set('n', '<leader>ld', require'telescope.builtin'.lsp_definitions, options)
vim.keymap.set('n', '<leader>ec', require'elem.telescope'.edit_config, options)
vim.keymap.set('n', '<leader>b', require'elem.telescope'.curbuf, options)
-- }}}

-- {{{ dap
vim.keymap.set('n', '<F5>', require'elem.dap'.start_c_debugger, options)
vim.keymap.set('n', '<F10>', require'dap'.step_over, options)
vim.keymap.set('n', '<F11>', require'dap'.step_into, options)
vim.keymap.set('n', '<F12>', require'dap'.step_out, options)
vim.keymap.set('n', '<F9>', require'dap'.toggle_breakpoint, options)
vim.keymap.set('n', '<leader>dr', require'dap'.repl.open, options)
vim.keymap.set('n', '<leader>dl', require'dap'.run_last, options)
-- }}}

-- {{{ iron.nvim
vim.keymap.set('n', ']x', "yrih", {silent = true})
-- }}}

-- {{{ lsptrouble
vim.keymap.set('n', '<leader>tt', '<cmd>TroubleToggle<cr>', options)
vim.keymap.set('n', '<leader>tw', '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', options)
vim.keymap.set('n', '<leader>td', '<cmd>TroubleToggle lsp_document_diagnostics<cr>', options)
-- }}}

-- {{{ toggleterm
vim.keymap.set('n', '<leader>tg', function() require('toggleterm').toggle_command("size=80 direction=vertical", 0) end, options)
-- }}}
