local M = {}

M.config = function ()
  vim.api.nvim_create_autocmd( 'LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function (event)
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
      end

      map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      map('<leader>ds',
      require('telescope.builtin').lsp_document_symbols,
      '[D]ocument [S]ymbols')
      map('<leader>ws',
      require('telescope.builtin').lsp_dynamic_workspace_symbols,
      '[W]orkspace [S]ymbols')
      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('K', vim.lsp.buf.hover, 'Hover Documentation')
      map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client.server_capabilities.documentHighlightProvider then
        local highlight_augroup =
        vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd('LspDetach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
          end,
        })
      end

      if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
        map('<leader>th', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, '[T]oggle Inlay [H]ints')
      end
    end,
  })
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities =
    vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

  local servers = {
    lua_ls = {
      setting = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          }
        }
      }
    },
    clangd = {},
  }

  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    'stylua',
  })

  require'mason-tool-installer'.setup{ ensure_installed = ensure_installed }
  require'mason-lspconfig'.setup {
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.capabilities =
          vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end,
    }
  }

  require'lspconfig'.ocamllsp.setup{
    capabilities = capabilities,
    settings = {
      codelens = { enable = true },
    },

    filetypes = {
      'ocaml',
      'ocaml.interface',
      'ocaml.menhir',
      'ocaml.cram',
    },
  }

  require("lspconfig.configs").cobol = {
    default_config = {
      cmd = {
        "/home/emilien/Development/ocamlpro/superbol-studio-oss/superbol-free-linux-x64",
        "lsp",
        "--force-syntax-diagnostics",
      },
      filetypes = { "cobol" },
      root_dir = function(startpath)
        local util = require("lspconfig").util
        return util.search_ancestors(startpath, function (path)
            if util.path.is_file(util.path.join(path, "superbol.toml")) then
              return path
            end
          end)
        or util.find_git_ancestor(startpath)
        or util.path.dirname(startpath)
      end,
      settings = {},
    },
  }

  require("lspconfig").cobol.setup({
    capabilities = capabilities, -- should be the same as other lsp
  })
  -- local custom_servers = {}
  --
  -- for server, config in pairs(custom_servers) do
  --   require'lspconfig.configs'[server] = {
  --     default_config = config.default_config,
  --   }
  --
  --   require'lspconfig'[server].setup(config.setup)
  -- end
end

return M
