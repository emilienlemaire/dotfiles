local cmp = require('cmp')
local lspkind = require('lspkind')

vim.opt.completeopt = {"menu", "menuone", "noselect"}

lspkind.init()

cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ["<C-y>"] = cmp.mapping(cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }, { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping(cmp.mapping.abort(), { 'i', 'c' }),
    ['<C-q>'] = cmp.mapping(cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }, { 'i', 'c' })
  }),
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "cmp_tabnine" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "latex_symbols" },
    { name = "neorg" },
  },
  {
    { name = 'buffer' },
  }),
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
    ghost_text = false,
  }
}
cmp.setup.filetype('markdown',
  {
    sources = cmp.config.sources(
    {
      { name = 'latex_symbols' },
    }
    )
  }
)

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer', option = { keyword_pattern = [=[[^[:blank:]].*]=] } }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources(
  {
    { name = 'path' },
  },
  {
    { name = 'cmdline' },
  })
})
