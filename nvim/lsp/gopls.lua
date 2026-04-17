return {
  settings = {
    gopls = {
      analyses = {
        -- Estas opciones molestan un poco al escribir, las puedo activar cuando necesite
        -- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
        ['ST1000'] = false,
        ['ST1020'] = false,
        ['ST1021'] = false,
        ['ST1022'] = false,
      },
      staticcheck = true
    }
  }
}
