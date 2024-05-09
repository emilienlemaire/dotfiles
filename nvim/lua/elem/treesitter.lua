local M = {}

M.config = function ()
  require'nvim-treesitter.install'.prefer_git = true
  require'nvim-treesitter.configs'.setup{
    ensure_installed = {
      'bash',
      'c',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
    },
    auto_install = true,
    highlight = {
      enable = true
    }
  }
end

return M
