local M = {}

M.servers = {
    jsonls = {
        init_options = {
            provideFormatter = false,
        },
    },
    clangd = {},
    gopls = {},
    pyright = {},
    rust_analyzer = {},
    tsserver = {},
    r_language_server = {},
    dockerls = {},
    docker_compose_language_service = {},
    bashls = {},
    cssls = {},
    html = {},
    emmet_ls = {},
    lua_ls = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

function M.on_attach(client, bufnr)
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

    -- Atajos menos usados de LSP
    nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, 'Workspace List Folders')

    -- Formateo para json
    if client.name == 'jsonls' then
        nmap('<leader>f', function()
            vim.cmd('%!jq .')
        end, 'Format file')
    end

    -- Activar el formateo de LSP
    if client.server_capabilities.documentFormattingProvider then
        nmap('<leader>f', function()
            vim.lsp.buf.format()
        end, 'Format file')
    end
end

return M
