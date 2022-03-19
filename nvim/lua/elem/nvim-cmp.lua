local cmp = require('cmp')
local lspkind = require('lspkind')

vim.opt.completeopt = {"menu", "menuone", "noselect"}

lspkind.init()

cmp.setup {
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ["<C-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-q>'] = cmp.mapping.confirm{
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "cmp_tabnine" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "latex_symbols" },
    { name = "neorg" },
    { name = "buffer" },
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind

      vim_item.kind = require("lspkind").presets.default[vim_item.kind] ..
      " " .. vim_item.kind
      -- set a name for each source
      --[[ if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ''
      end ]]
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        ultisnips = "[UltiSnips]",
        nvim_lua = "[Lua]",
        cmp_tabnine = "[TabNine]",
        look = "[Look]",
        path = "[Path]",
        spell = "[Spell]",
        calc = "[Calc]",
        emoji = "[Emoji]"
      })[entry.source.name]
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  }
}
