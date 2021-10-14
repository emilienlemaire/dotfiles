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
  local success, result = pcall(loadstring(s))
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
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  ["Catppuccino.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/Catppuccino.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-tabnine"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/colorbuddy.vim"
  },
  colorizer = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/colorizer"
  },
  ["express_line.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/express_line.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["indent-guides.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  ["jupytext.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/jupytext.vim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["llvm-vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/llvm-vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  neogit = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["one-nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/one-nvim"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["pseudo-syntax"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/pseudo-syntax"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["treesitter-context.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/treesitter-context.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-cmake"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-menhir"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-menhir"
  },
  ["vim-mkdir"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-mkdir"
  },
  ["vim-ocaml"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-ocaml"
  },
  ["vim-ripple"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-ripple"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-textobj-hydrogen"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-textobj-hydrogen"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  vimwiki = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["vs-snippets"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vs-snippets"
  },
  ["yaml.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\14yaml_nvim\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/yaml.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'yaml.nvim'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
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
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
