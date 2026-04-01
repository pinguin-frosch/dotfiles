return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'BufRead', 'BufNewFile' },

  -- inspirado en la configuracion de kartikvashistha
  -- https://github.com/kartikvashistha/ansible-playbooks/blob/6b3d5df880782ddd40a6349e2113272b67ce8c55/roles/neovim/files/nvim/lua/plugins/editor.lua#L51-L80
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter.setup', {}),
      callback = function(args)
        local buf = args.buf
        local filetype = args.match
        local language = vim.treesitter.language.get_lang(filetype) or filetype

        -- ignorar lenguages sin soporte de treesitter
        if not vim.treesitter.language.add(language) then
          return
        end

        -- activar highlighting
        vim.treesitter.start(buf, language)

        -- activar indentado
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    })
  end,
}
