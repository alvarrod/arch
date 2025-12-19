
---@brief
---
--- https://github.com/latex-lsp/texlab
---
--- LaTeX LSP Implementation
return {
  cmd = { 'texlab' },
  filetypes = { 'tex', 'plaintex', 'latex' },
  root_markers = { '.git', 'main.tex' },
  settings = {
    texlab = {
      build = {
        executable = 'latexmk',
        args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
        onSave = true, -- compila automáticamente al guardar
      },
      forwardSearch = {
        executable = 'zathura',
        args = { '--synctex-forward', '%l:1:%f', '%p' },
      },
      chktex = {
        onEdit = true,
        onOpenAndSave = true,
      },
    },
  },
}
