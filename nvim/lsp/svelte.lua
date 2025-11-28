return {
  on_attach = function(client, _)
    if client.name == "svelte" then
      vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
        pattern = { '*.js', '*.ts' },
        callback = function(ctx)
          client.notify('$/onDidChangeTsOrJsFile', {
            uri = ctx.match
          })
        end
      })
    end
  end
}
