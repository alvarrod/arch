vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('texlab.lua')
vim.lsp.enable('bashls.lua')
vim.lsp.enable('clangd.lua')
vim.lsp.enable('cmake.lua')
vim.lsp.enable('css_variables.lua')
vim.lsp.enable('cssls.lua')
vim.lsp.enable('cssmodules_ls')
vim.lsp.enable('docker_compose_language_service.lua')
vim.lsp.enable('dockerls.lua')
vim.lsp.enable('sqlls.lua')
vim.lsp.enable('ts_ls.lua')

vim.diagnostic.config(
    {
        virtual_text = true,
        virtual_lines = true
    }
)
