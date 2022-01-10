local lsp = require('lspconfig')
local nvim_status = require('lsp-status')
local utils = require('utils')
local status = require('elem.lsp_status')

status.activate()

local custom_attach = function(client)
  local options = {
    noremap = true,
    silent = true,
  }

  utils.map_lua_buf('n', '<c-]>', [[vim.lsp.buf.definition()]], options)
  utils.map_lua_buf('n', 'gD', [[vim.lsp.buf.implementation()]], options)
  utils.map_lua_buf('n', 'gs', [[vim.lsp.buf.signature_help()]], options)
  utils.map_lua_buf('n', 'gT', [[vim.lsp.buf.type_definition()]], options)
  utils.map_lua_buf('n', 'grf', [[vim.lsp.buf.references()]], options)
  utils.map_lua_buf('n', 'g0', [[vim.lsp.buf.document_symbol()]], options)
  utils.map_lua_buf('n', 'gW', [[vim.lsp.buf.workspace_symbol()]], options)
  utils.map_lua_buf('n', 'K', [[vim.lsp.buf.hover()]], options)
  utils.map_lua_buf('n', '<leader>sd', [[vim.diagnostic.open_float()]], options)
  utils.map_lua_buf('n', '<leader>ca', [[vim.lsp.buf.code_action()]], options)
  utils.map_lua_buf('n', '<leader>rn', [[vim.lsp.buf.rename()]], options)
  utils.map_buf('v', '<leader>ca', [[<cmd>'<,'>lua vim.lsp.buf.range_code_action()<cr>]], options)
  utils.map_buf('n', '<leader>sh', ':ClangdSwitchSourceHeader<cr>', options)
  status.on_attach(client)
  require "lsp_signature".on_attach()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--cross-file-rename"
  },
  on_attach = custom_attach,
  handlers = nvim_status.extensions.clangd.setup(),
  capabilities = clangd_capabilities,
})

lsp.vimls.setup({
  on_attach = custom_attach,
})

local system_name = utils.get_system_name()

local sumneko_root_path = "/Users/emilienlemaire/Development/lua/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
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
}

lsp.texlab.setup({
  on_attach = custom_attach,
})

lsp.cmake.setup({
  on_attach = function(client)
    require "lsp_signature".on_attach()
  end,
  capabilities = capabilities
})

require('nlua.lsp.nvim').setup(require('lspconfig'), {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  on_attach = custom_attach,

  -- Include globals you want to tell the LSP are real :)
  globals = {
    -- Colorbuddy
    "Color", "c", "Group", "g", "s",
  }
})


lsp.html.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
}

lsp.jedi_language_server.setup({
  on_attach = custom_attach,
  filetypes = { "python", "sage" }
})

lsp.clojure_lsp.setup {
  on_attach = custom_attach,
  capabilities = capabilities
}

lsp.ocamllsp.setup{
  on_attach = function(client)
    custom_attach(client)
    require'virtualtypes'.on_attach()
  end
}

local configs = require("lspconfig.configs")

if not configs.isabelle then
  configs.isabelle = {
    default_config = {
        cmd = {'isabelle', 'vscode_server', '-v', '-L', '/tmp/isalsp.log', '-o', 'vscode_html_output=false'},
        filetypes = {'isabelle'},
        root_dir = function(fname)
            return lsp.util.find_git_ancestor(fname) or vim.fn.getcwd()
        end,
        settings = {}
  }
}
end

lsp.isabelle.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
