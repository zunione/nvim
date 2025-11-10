--[[
-   NOTE      - keymaps.lua
-   Author    - zunione
-
-   Created   - 2025.11.05
-   Github    - https://github.com/zunione
-   Contact   - xt.wish1@gmail.com
]]



-- ========================= --
-- =     UI & DISPLAY      = --
-- ========================= --
vim.o.mouse = 'a'                   -- Enable mouse mode (default: '')
vim.wo.number = true                -- Make line numbers default (default: false)
vim.o.relativenumber = true         -- Set relative numbered lines (default: false)

vim.o.cursorline = true                       -- Highlight current line
vim.api.nvim_create_autocmd("ColorScheme", {  -- Set colors for cursorline highlight
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2d2d2d" })                -- Set the background color of the CursorLine
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffaa", bold = true }) -- Set the foreground color of the CursorLineNr
  end,
})

vim.o.signcolumn = 'yes'            -- Keep signcolumn on by default
vim.o.wrap = false                  -- Display lines as one long line (default: true)
vim.o.linebreak = true              -- Companion to wrap, don't split words (default: false)
vim.o.showtabline = 1               -- Show tab line if there are at least two tabs
vim.opt.termguicolors = true        -- set termguicolors to enable highlight groups



-- ========================= --
-- =        INDENT         = --
-- ========================= --
vim.o.smartindent = true            -- make indenting smarter again
vim.o.autoindent = true             -- Copy indent from current line when starting new one (default: true)
vim.o.breakindent = true            -- Enable break indent

vim.o.shiftwidth = 4                -- The number of spaces inserted for each indentation (default: 8)
vim.o.tabstop = 4                   -- Insert N spaces for a tab (default: 8)
vim.o.softtabstop = 4               -- Number of spaces that a tab counts for while performing editing operations

-- File type specific indent settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"lua", "dart", "javascript", "typescript", "typescriptreact", "javascriptreact"},
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})



-- ========================= --
-- =        EDITING        = --
-- ========================= --
vim.o.expandtab = true                          -- Convert tabs to spaces (default: false)
vim.o.backspace = 'indent,eol,start'            -- allow backspace on
vim.opt.formatoptions:remove { 'c', 'r', 'o' }  -- don't insert the current comment leader automatically



-- ========================= --
-- =         SEARCH        = --
-- ========================= --
vim.o.smartcase = true              -- Smart case (default: false)
vim.o.ignorecase = true             -- Case-insensitive searching UNLESS \C or capital in search (default: false)



-- ========================= --
-- =    SYSTEM & FILES     = --
-- ========================= --
vim.o.clipboard = 'unnamedplus'                       -- Sync clipboard between OS and Neovim (default: '')
vim.o.undofile = true                                 -- Save undo history
vim.o.fileencoding = 'utf-8'                          -- the encoding written to a file
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles'  -- separate vim plugins from neovim
