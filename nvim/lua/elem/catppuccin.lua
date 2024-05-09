local M = {}

M.config = function ()
  require'catppuccin'.setup{
    integrations = {
      fidget = true,
      mason = true,
    }
  }

  vim.cmd.colorscheme('catppuccin-mocha')
end

return M
