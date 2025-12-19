-- Mason handles the installation of LSPs
-- Mason LSP config forces the installation of the required ones/
return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                    ensure_installed = { "lua_ls", "pyright", "bashls", "clangd", "cmake", "css_variables", "cssls",
                    "cssmodules_ls", "docker_compose_language_service", "dockerls", "sqlls", "ts_ls"}
            })
        end
    },
}
