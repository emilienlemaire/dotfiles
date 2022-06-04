local lspconfig = require('lspconfig')
local utils = require('utils')

vim.lsp.handlers["window/showMessage"] = require("elem.lsp.show_message")
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with (
  vim.lsp.handlers.hover, {
    border = "rounded",
  }
)
require("elem.lsp.show_message")

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
  if client.name == "clangd" then
    utils.map_buf('n', '<leader>sh', ':ClangdSwitchSourceHeader<cr>', options)
  end

  if client.server_capabilities.code_lens then
    require'virtualtypes'.on_attach()
  end
  require "lsp_signature".on_attach()
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
updated_capabilities = require('cmp_nvim_lsp').update_capabilities(updated_capabilities)

lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--cross-file-rename"
  },
  init_options = {
    clangdFileStatus = true,
  },
  on_attach = custom_attach,
  capabilities = updated_capabilities,
})

lspconfig.vimls.setup({
  on_attach = custom_attach,
  capabilities = updated_capabilities,
})

lspconfig.rust_analyzer.setup{
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}

lspconfig.sumneko_lua.setup {
  cmd = {"lua-language-server"},
  on_attach = custom_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
  capabilities = updated_capabilities,
}

lspconfig.ltex.setup({
  on_attach = custom_attach,
  capabilities = updated_capabilities,
})

lspconfig.texlab.setup({
  on_attach = custom_attach,
  capabilities = updated_capabilities,
})

lspconfig.cmake.setup({
  on_attach = function(_)
    require "lsp_signature".on_attach()
  end,
  capabilities = updated_capabilities,
})

require('nlua.lsp.nvim').setup(require('lspconfig'), {
  on_attach = custom_attach,
  capabilities = updated_capabilities,

  -- Include globals you want to tell the LSP are real :)
  globals = {
    -- Colorbuddy
    "Color", "c", "Group", "g", "s",
  }
})

lspconfig.html.setup {
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}

lspconfig.jedi_language_server.setup({
  on_attach = custom_attach,
  filetypes = { "python", "sage" },
  capabilities = updated_capabilities,
})

lspconfig.clojure_lsp.setup {
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}

lspconfig.ocamllsp.setup{
  on_attach = custom_attach,
  capabilities = updated_capabilities,
  filetypes = { "ocaml", "ocaml_interface", "menhir" },
}

local configs = require("lspconfig.configs")

if not configs.isabelle then
  configs.isabelle = {
    default_config = {
        cmd = {'isabelle', 'vscode_server', '-v', '-L', '/tmp/isalsp.log', '-o', 'vscode_html_output=false'},
        filetypes = {'isabelle'},
        root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
        end,
        settings = {}
  }
}
end

if not configs.cobol then
  configs.cobol = {
    default_config = {
      cmd = {'/Users/emilienlemaire/Development/cobol/che-che4z-lsp-for-cobol/server/cobol-language-support'},
      filetypes = {'cobol'},
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
      end,
      settings = {}
    }
  }
end

lspconfig.isabelle.setup{
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}

lspconfig.cobol.setup {
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}
