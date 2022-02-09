local g = vim.g
local o = vim.o
local cmd = vim.cmd
local w = vim.wo
local b = vim.bo

local utils = require('utils')

local _ = require('bootstrap')

g.mapleader = ';'

b.autoindent = true
b.expandtab = true
b.softtabstop = 4
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true
b.modeline = true
b.swapfile = false

o.backspace = [[indent,eol,start]]
o.hidden = true
w.winfixwidth = false

o.lazyredraw = true

o.splitbelow = true
o.splitright = true

w.cursorline = true
b.synmaxcol = 4000

w.number = true
w.relativenumber = true

w.list = true
if vim.fn.has('multi_byte') == 1 and vim.o.encoding == 'utf-8' then
  o.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
else
  o.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
end

w.colorcolumn = [[100]]
w.wrap = false

o.termguicolors = true

o.clipboard = [[unnamed,unnamedplus]]

o.scrolloff = 4

o.timeoutlen = 300

o.mouse = 'a'

if o.shell == 'fish$' then
  o.shell = [[/bin/bash]]
end


o.completeopt = [[menuone,noselect]]

o.ignorecase = true
o.smartcase = true

-- General mappings, not depending on any plugins
vim.api.nvim_set_keymap('v', 'J', [[:m '>+1<cr>gv=gv]], {noremap = true})
vim.api.nvim_set_keymap('v', 'K', [[:m '<-2<cr>gv=gv]], {noremap = true})

vim.api.nvim_set_keymap('n', '<A-Tab>', ':tabnext<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-S-Tab>', ':tabprev<cr>', {noremap = true})
vim.api.nvim_set_keymap('t', '<A-Tab>', '<c-\\><c-n>:tabnext<cr>', {noremap = true})
vim.api.nvim_set_keymap('t', '<A-S-Tab>', '<c-\\><c-n>:tabprev<cr>', {noremap = true})

vim.api.nvim_set_keymap('n', '<Up>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Down>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Left>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Right>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})

vim.api.nvim_set_keymap('i', '<C-c>', '<esc>', {noremap = true})

local home = os.getenv('HOME')

-- vim.api.nvim_set_var('python_host_prog', home .. '/opt/miniconda3/envs/conda2/bin/python')
-- vim.api.nvim_set_var('python3_host_prog', home .. 'Users/emilienlemaire/mambaforge/envs/nvim/bin/python')
vim.api.nvim_set_var('ruby_host_prog', '/opt/homebrew/lib/ruby/gems/3.0.0/gems/neovim-0.8.1/exe/neovim-ruby-host')

vim.api.nvim_set_var('opamshare', home .. '/.opam/default/share')

vim.api.nvim_set_var('merlin_python_version', 3)

utils.add_rtp(home .. '/.opam/default/share/merlin/vim/doc')
utils.add_rtp(home .. '/.opam/default/share/merlin/vim')
utils.add_rtp(home .. '/.opam/default/share/merlin/vimbufsync')

-- REQUIRES
require('plugins')
require('zest').setup()
require("hotpot").setup({
    modules = {'zest'},
    macros = {
        env = '_COMPILER'
    }
})
local ok, res = pcall(function() require('lsp_config') end)

if not ok then
  print("No LSP")
  print(res)
end

RELOAD = require('plenary.reload').reload_module


R = function(name)
  RELOAD(name)
  return require(name)
end

R('nvim-web-devicons').setup()
R('gitsigns').setup()
R('lspkind').init()
RELOADER = function()
  R("elem.autocmds")
  R('elem.luasnip')
  R('elem.nvim-cmp')
  R('elem.treesitter')
  R('elem.statusline')
  R('elem.plenary')
  R('elem.telescope')
  R('elem.ripple')
  -- R('elem.rust-tools')
  R('mappings')
  R('globals')
  R('elem.catppuccino')
end

RELOADER()

cmd [[colorscheme catppuccin]]

cmd  [[hi DiagnosticUnderlineError gui=undercurl guisp=Red]]
cmd  [[hi DiagnosticUnderlineWarn gui=undercurl guisp=Orange]]
b.shiftwidth = 4
