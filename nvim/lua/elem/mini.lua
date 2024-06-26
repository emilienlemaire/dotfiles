local M = {}

M.config = function ()
  require'mini.ai'.setup{
    n_lines = 500,
  }

  require'mini.surround'.setup{}

  local statusline = require'mini.statusline'
  statusline.setup { use_icons = vim.g.have_nerd_font }

  ---@diagnostic disable-next-line: duplicate-set-field
  statusline.section_location = function()
    return '%2l:%-2v'
  end

  require'mini.indentscope'.setup{}

  require'mini.sessions'.setup{}

  -- require'mini.starter'.setup{}
end

return M
