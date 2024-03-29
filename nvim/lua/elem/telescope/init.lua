if not pcall(require, 'telescope') then
  return
end

local should_reload = true

local reloader = function()
  if should_reload then
    RELOAD('plenary')
    RELOAD('popup')
    RELOAD('telescope')
  end
end

reloader()

local themes = require('telescope.themes')
local trouble = require("trouble.providers.telescope")
local multi_rg = require("elem.telescope.multi_rg")

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"undodir/.*", "yarn%.lock", "node_modules/.*"},

    layout_strategy = "flex",
    layout_config = {prompt_position = "top"},

    file_sorter = require("elem.telescope.frecency").frecency_sorter,

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    set_env = { ["COLORTERM"] = "truecolor" },
    extensions = {
      fzf = {
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      },
      file_browser = {
        theme = "ivy",
        hijack_netrw = true,
      },
      ["ui-select"] = {
        require('telescope.themes').get_dropdown()
      },
    },

    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('luasnip')
require('telescope').load_extension('ui-select')

local M = {}

function M.git_files()
  local opts = themes.get_ivy()
  require('telescope.builtin').git_files(opts)
end

function M.edit_config()
  require('telescope.builtin').git_files {
    prompt_title = "~ config ~",
    shorten_path = false,
    cwd = "~/.config"
  }
end

function M.curbuf()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false
  }

  require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

function M.multi_rg(opts)
  multi_rg(opts)
end

return setmetatable({}, {
  __index = function(_, k)
    reloader()

    if M[k] then
      return M[k]
    else
      return require('telescope.builtin')[k]
    end
  end
})
