return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'b0o/SchemaStore.nvim' },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local on_attach = function(client, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
      nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

      nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
      nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
      nmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
      nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')

      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      nmap('gl', vim.diagnostic.open_float, 'Open Diagnostic Float')

      -- Atajos menos usados de LSP
      nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, 'Workspace List Folders')

      -- Activar el formateo de LSP
      if client.server_capabilities.documentFormattingProvider then
        nmap('<leader>f', function()
          vim.lsp.buf.format()
        end, 'Format file')
      end
    end

    local servers = { 'tsserver', 'clangd', 'gopls', 'pyright', 'rust_analyzer', 'r_language_server', 'dockerls',
      'docker_compose_language_service', 'bashls', 'cssls', 'lua_ls', 'html' }

    for _, lsp in ipairs(servers) do
      require('lspconfig')[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    require('lspconfig')['jsonls'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        provideFormatter = true
      },
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true }
        }
      }
    })

    require('lspconfig')['lua_ls'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          },
          workspace = {
            checkThirdParty = false
          }
        }
      }
    })
  end
}
