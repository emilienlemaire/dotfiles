local M = {}
local cmd = vim.cmd
cmd [[packadd packer.nvim]]
local packer = require('packer')

function M.add_rtp(path)
  local rtp = vim.o.rtp
  rtp = rtp .. ',' .. path
end

function M.map(mode, keys, action, options)
  if options == nil then
    options = {}
  end
  vim.api.nvim_set_keymap(mode, keys, action, options)
end

function M.map_lua(mode, keys, action, options)
  if options == nil then
    options = {}
  end
  vim.api.nvim_set_keymap(mode, keys, "<cmd>lua " .. action .. "<cr>", options)
end

function M.map_buf(mode, keys, action, options, buf_nr)
  if options == nil then
    options = {}
  end
  local buf = buf_nr or 0
  vim.api.nvim_buf_set_keymap(buf, mode, keys, action, options)
end

function M.map_lua_buf(mode, keys, action, options, buf_nr)
  if options == nil then
    options = {}
  end
  local buf = buf_nr or 0
  vim.api.nvim_buf_set_keymap(buf, mode, keys, "<cmd>lua " .. action .. "<cr>", options)
end

function M.reload_plugins()
    cmd [[luafile ~/.config/nvim/lua/plugins.lua]]
    packer.sync()
    packer.compile()
end

function M.get_system_name()
  if vim.fn.has("mac") == 1 then
    return "macOS"
  elseif vim.fn.has("unix") == 1 then
    return "Linux"
  elseif vim.fn.has('win32') == 1 then
    return "Windows"
  else
    print("Unsupported system for sumneko")
  end
end

_G.utils = M
return M
