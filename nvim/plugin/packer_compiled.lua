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
  ["calvera-dark.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/calvera-dark.nvim"
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
  ["gmpl.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/gmpl.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["indent-guides.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  neofs = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/neofs"
  },
  neogit = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
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
  ["treesitter-context.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/treesitter-context.nvim"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/typescript-vim"
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
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-glsl"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-glsl"
  },
  ["vim-header"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-header"
  },
  ["vim-js"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-js"
  },
  ["vim-js-file-import"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-js-file-import"
  },
  ["vim-jsx-improve"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-jsx-improve"
  },
  ["vim-jsx-typescript"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-jsx-typescript"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-mkdir"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-mkdir"
  },
  ["vim-nix"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-nix"
  },
  ["vim-ocaml"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-ocaml"
  },
  ["vim-react-snippets"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-react-snippets"
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
  ["vim-styled-components"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-styled-components"
  },
  ["vim-unicoder"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-unicoder"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
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
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  ["vs-snippets"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vs-snippets"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
