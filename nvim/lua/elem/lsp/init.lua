local lspconfig = require('lspconfig')
local lspconfig_util = require('lspconfig.util')
local utils = require('utils')

vim.lsp.set_log_level(vim.lsp.log_levels.INFO)

vim.lsp.handlers["window/showMessage"] = require("elem.lsp.show_message")
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with (
  vim.lsp.handlers.hover, {
    border = "rounded",
  }
)
vim.lsp.handlers["workspace/diagnostic/refresh"] = vim.lsp.with()

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
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
updated_capabilities = require('cmp_nvim_lsp').default_capabilities(updated_capabilities)

lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--"
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

require('neodev').setup {}

lspconfig.lua_ls.setup {
  on_attach = custom_attach,
  capabilities = updated_capabilities,
  root_dir = function(fname)
    return lspconfig_util.find_git_ancestor(fname) or lspconfig_util.path.dirname(fname)
  end,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enabled = false,
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}

lspconfig.ltex.setup({
  on_attach = custom_attach,
  capabilities = updated_capabilities,
  settings = {
    ltex = {
      language = "fr"
    }
  }
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
  filetypes = { "ocaml", "ocaml_interface", "menhir", "ocamllex" },
}

lspconfig.bashls.setup{
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}

require'lspconfig'.hls.setup{
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}

local configs = require("lspconfig.configs")

if not configs.coq then
  configs.coq = {
    default_config = {
      cmd = {'node', '/Users/emilienlemaire/Development/ocaml/vscoq/out/server/src/server.js', '--stdio'},
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
      end,
      filetypes = {'coq'},
      settings = {
        coqtop = {
          binPath = "/Users/emilienlemaire/.opam/default/bin/coqtop",
        },
        coq = {
          coqProjectRoot = ".",
        }
      },
    },
  }
end

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
      cmd = {
        'mono',
        '/Users/emilienlemaire/Development/ocamlpro/TypeCobol/bin/Debug/TypeCobol.LanguageServer.exe',
        '--loglevel=2',
        '--logfile=/Users/emilienlemaire/.local/state/TypeCobol/lsp.log',
        '--robot',
      },
      filetypes = {'cobol'},
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
      end,
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

if not configs.agda then
  configs.agda = {
    default_config = {
      cmd = { 'als', '+AGDA', '--interaction', '-AGDA' },
      filetypes = { 'agda' },
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
      end,
    },
  }
end

lspconfig.agda.setup {
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}

if false then
lspconfig.coq.setup {
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}
end
