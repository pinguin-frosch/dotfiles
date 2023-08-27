return {
  {
    'lewis6991/gitsigns.nvim',
    config = true
  },
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_enabled = 0

      -- Atajo para alternar el estado de Copilot
      vim.keymap.set('n', '<leader>tc', function()
        if vim.g.copilot_enabled == 1 then
          vim.cmd('Copilot disable')
          print('Copilot disabled')
        else
          vim.cmd('Copilot enable')
          print('Copilot enabled')
        end
      end, { desc = 'Toggle Copilot' })
    end,
  }
}
