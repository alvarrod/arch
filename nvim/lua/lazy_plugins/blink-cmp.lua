-- Blink-cmp provides autocompletion and snippets
return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries for the fuzzy finder
    version = '1.*',
    opts = {
        keymap = { preset = 'default' },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },
        signature = { enabled = true }
    },
    -- opts_extend = { "sources.default" }
}
