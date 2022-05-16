-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/emilienlemaire/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/emilienlemaire/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/emilienlemaire/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/emilienlemaire/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/emilienlemaire/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/BetterLua.vim",
    url = "https://github.com/euclidianAce/BetterLua.vim"
  },
  ["COBOL.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/COBOL.vim",
    url = "https://github.com/Jorengarenar/COBOL.vim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  colorizer = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/colorizer",
    url = "https://github.com/lilydjwg/colorizer"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hotpot.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/hotpot.nvim",
    url = "https://github.com/rktjmp/hotpot.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nq\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\1\0\1\tchar\6|\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["jupytext.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/jupytext.vim",
    url = "https://github.com/GCBallesteros/jupytext.vim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/wbthomason/lsp-status.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim",
    url = "https://github.com/nvim-lua/lsp_extensions.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine-theme.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lualine-theme.nvim",
    url = "https://github.com/yorik1984/lualine-theme.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neogit = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  neorg = {
    config = { "\27LJ\2\n­\2\0\0\a\0\18\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\4=\4\b\0035\4\t\0004\5\0\0=\5\a\4=\4\n\0035\4\14\0005\5\f\0005\6\v\0=\6\r\5=\5\a\4=\4\15\3=\3\17\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\1\0\0\18core.keybinds\vconfig\1\0\0\1\0\2\21default_keybinds\2\17neorg_leader\14<Leader>o\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["newpaper.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/newpaper.nvim",
    url = "https://github.com/yorik1984/newpaper.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nlua.nvim",
    url = "https://github.com/tjdevries/nlua.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-luapad",
    url = "https://github.com/rafcamlet/nvim-luapad"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua",
    url = "https://github.com/akinsho/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["one-nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/one-nvim",
    url = "https://github.com/Th3Whit3Wolf/one-nvim"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/onedark.vim",
    url = "https://github.com/joshdick/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["pseudo-syntax"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/pseudo-syntax",
    url = "https://github.com/joelbeedle/pseudo-syntax"
  },
  tabular = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-luasnip.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/telescope-luasnip.nvim",
    url = "https://github.com/benfowler/telescope-luasnip.nvim"
  },
  ["telescope-toggleterm.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\15toggleterm\19load_extension\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/telescope-toggleterm.nvim",
    url = "https://git.sr.ht/~havi/telescope-toggleterm.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n¿\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vsearch\1\0\0\targs\1\b\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\a-g\14!vendor/*\1\0\1\fcommand\arg\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tree-sitter-menhir"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/tree-sitter-menhir",
    url = "https://github.com/emilienlemaire/tree-sitter-menhir"
  },
  ["treesitter-context.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/treesitter-context.nvim",
    url = "https://github.com/vigoux/treesitter-context.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-cmake",
    url = "https://github.com/cdelledonne/vim-cmake"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-menhir"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-menhir",
    url = "https://github.com/ELLIOTTCABLE/vim-menhir"
  },
  ["vim-mkdir"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-mkdir",
    url = "https://github.com/pbrisbin/vim-mkdir"
  },
  ["vim-ocaml"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-ocaml",
    url = "https://github.com/ocaml/vim-ocaml"
  },
  ["vim-ripple"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-ripple",
    url = "https://github.com/urbainvaes/vim-ripple"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-textobj-hydrogen"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-textobj-hydrogen",
    url = "https://github.com/GCBallesteros/vim-textobj-hydrogen"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["virtual-types.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/virtual-types.nvim",
    url = "https://github.com/jubnzv/virtual-types.nvim"
  },
  ["yaml.nvim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/yaml.nvim",
    url = "https://github.com/cuducos/yaml.nvim"
  },
  ["zest.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tzest\frequire\0" },
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/zest.nvim",
    url = "https://github.com/tsbohc/zest.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: zest.nvim
time([[Config for zest.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tzest\frequire\0", "config", "zest.nvim")
time([[Config for zest.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: hotpot.nvim
time([[Config for hotpot.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "hotpot.nvim")
time([[Config for hotpot.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nq\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\1\0\1\tchar\6|\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n­\2\0\0\a\0\18\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\4=\4\b\0035\4\t\0004\5\0\0=\5\a\4=\4\n\0035\4\14\0005\5\f\0005\6\v\0=\6\r\5=\5\a\4=\4\15\3=\3\17\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\1\0\0\18core.keybinds\vconfig\1\0\0\1\0\2\21default_keybinds\2\17neorg_leader\14<Leader>o\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n¿\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vsearch\1\0\0\targs\1\b\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\a-g\14!vendor/*\1\0\1\fcommand\arg\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'yaml.nvim'}, { ft = "yaml" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au TermOpen * ++once lua require("packer.load")({'telescope-toggleterm.nvim'}, { event = "TermOpen *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
