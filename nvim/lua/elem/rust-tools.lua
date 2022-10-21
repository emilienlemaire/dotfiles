local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local custom_attach = function(client)
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  local options = {
    noremap = true,
    silent = true,
  }

  local options_buf = {
    noremap = true,
    silent = true,
    buffer = true,
  }

  local options_hover = {
    noremap = true,
    silent = true,
    buffer = true,
    desc = "lsp:hover",
  }

  vim.keymap.set('n', '<c-]>', vim.lsp.buf.definition, options_buf)
  vim.keymap.set('n', 'gD', vim.lsp.buf.implementation, options_buf)
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, options_buf)
  vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, options_buf)
  vim.keymap.set('n', 'grf', vim.lsp.buf.references, options_buf)
  vim.keymap.set('n', 'g0', vim.lsp.buf.document_symbol, options_buf)
  vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol, options_buf)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, options_buf)
  vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, options_buf)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, options_buf)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, options_hover)
  utils.map_buf('v', '<leader>ca', [[<cmd>'<,'>lua vim.lsp.buf.range_code_action()<cr>]], options)
  vim.keymap.set('n', '<leader>ha', [[<cmd>RustHoverActions<cr>]], options_buf)
  if client.name == "clangd" then
    utils.map_buf('n', '<leader>sh', ':ClangdSwitchSourceHeader<cr>', options)
  end

  if client.server_capabilities.code_lens then
    require'virtualtypes'.on_attach()
  end
  require "lsp_signature".on_attach()
end

local opts = {
  tools = {
    autoSetHints = true,
    inlay_hints = {
      show_parameter_hint = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  server = {
    on_attach = custom_attach,
    capabilities = capabilities,
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = 'clippy'
        }
      }
    }
  }
}

require('rust-tools').setup(opts)
