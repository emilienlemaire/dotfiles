-- local _ = require('ootstrap')init

local utils = require('utils')

vim.g.mapleader = ' '
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.modeline = true
vim.o.swapfile = false
vim.o.undofile = true


vim.o.cmdheight = 1
vim.o.backspace = [[indent,eol,start]]
vim.o.hidden = true
vim.o.winfixwidth = false

vim.o.lazyredraw = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.cursorline = true
vim.o.synmaxcol = 4000

vim.o.number = true
vim.o.relativenumber = true

vim.o.list = true
if vim.fn.has('multi_byte') == 1 and vim.o.encoding == 'utf-8' then
  vim.o.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
else
  vim.o.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
end

vim.o.colorcolumn = [[100]]
vim.o.wrap = false

vim.o.termguicolors = true

vim.o.clipboard = [[unnamed,unnamedplus]]

vim.o.scrolloff = 4

vim.o.timeoutlen = 400

vim.o.mouse = 'a'

if vim.o.shell == 'fish$' then
  vim.o.shell = [[/bin/bash]]
end

vim.o.completeopt = [[menuone,noselect]]

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.pumblend = 17
vim.o.wildmode = "longest:full"
vim.o.wildoptions = "pum"

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

-- vim.api.nvim_set_var('python_host_prog', home .. '/o/miniconda3/envs/conda2/bin/python')
-- vim.api.nvim_set_var('python3_host_prog', home .. 'Users/emilienlemaire/mambaforge/envs/nvim/bin/python')
vim.api.nvim_set_var('ruby_host_prog', '/opt/homebrew/lib/ruby/gems/3.1.0/bin/neovim-ruby-host')

local opamshare = vim.fn.system("opam var share"):gsub("\n", "")

vim.api.nvim_set_var('opamshare', opamshare)

vim.api.nvim_set_var('merlin_python_version', 3)

utils.add_rtp(opamshare .. '/merlin/vim/doc')
utils.add_rtp(opamshare .. '/merlin/vim')
utils.add_rtp(opamshare .. '/merlin/vimbufsync')
utils.add_rtp(opamshare .. '/ocp-index/vim')

-- REQUIRES
require('plugins')

local ok, res = pcall(function() require('elem.lsp') end)

if not ok then
  print("No LSP")
  print(res)
end

RELOAD = require('plenary.reload').reload_module


R = function(name)
  RELOAD(name)
  return require(name)
end

R("mappings")
R("globals")
R("elem")
