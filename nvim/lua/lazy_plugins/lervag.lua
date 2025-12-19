return {
    "lervag/vimtex",
    ft = { "tex", "plaintex", "latex" },
    config = function()
        -- General VimTeX settings
        vim.g.vimtex_view_method = "zathura"       -- use Zathura for PDF viewing
        vim.g.vimtex_compiler_method = "latexmk"   -- use latexmk for building
        vim.g.vimtex_view_forward_search_on_start = 1
        vim.g.vimtex_quickfix_mode = 0             -- don't open quickfix automatically

        -- Optional: customize latexmk options (e.g., use xelatex)
        vim.g.vimtex_compiler_latexmk = {
            build_dir = "build",                   -- output directory for generated files
            options = {
                "-pdf",
                "-interaction=nonstopmode",
                "-synctex=1",
            },
        }

        -- Optional: mappings (if you want to tweak defaults)
        vim.g.vimtex_mappings_enabled = 1
        vim.g.vimtex_complete_enabled = 1
        vim.g.vimtex_syntax_enabled = 1
    end,
}
