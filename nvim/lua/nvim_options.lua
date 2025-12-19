vim.g.mapleader = " "
vim.g.maplocalleader = "\\" -- optional, for local mappings

local o = vim.opt

o.termguicolors = true
o.number = true             -- Show line numbers
o.relativenumber = true     -- Relative line numbers
o.mouse = "a"               -- Enable mouse support in all modes
o.hlsearch = true           -- Highlight search results
o.incsearch = true          -- Show search matches while typing
o.colorcolumn = "80"

o.expandtab = true          -- Use spaces instead of tabs
o.tabstop = 4               -- Number of spaces per tab
o.shiftwidth = 4            -- Number of spaces per indentation level
o.autoindent = true         -- Copy indent from current line when starting new line
o.smartindent = true        -- Smart autoindenting when starting new lines

o.showmatch = true          -- Highlight matching brackets
o.wildmenu = true           -- Better command-line completion UI

o.termguicolors = true      -- Enable true color support

o.wrap = true               -- Enable line wrapping

o.timeoutlen = 500          -- Time to wait for a mapped sequence to complete (in ms)

o.clipboard = "unnamedplus" -- Use system clipboard for copy/paste
