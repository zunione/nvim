-- Enable mouse mode (default: '')
vim.o.mouse = 'a'

-- Make line numbers default (default: false)
vim.wo.number = true
-- Set relative numbered lines (default: false)
vim.o.relativenumber = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Sync clipboard between OS and Neovim (default: '')
vim.o.clipboard = 'unnamedplus'

-- Display lines as one long line (default: true)
vim.o.wrap = false
-- Companion to wrap, don't split words (default: false)
vim.o.linebreak = true

-- Smart case (default: false)
vim.o.smartcase = true
-- Case-insensitive searching UNLESS \C or capital in search (default: false)
vim.o.ignorecase = true

-- make indenting smarter again
vim.o.smartindent = true
-- Copy indent from current line when starting new one (default: true)
vim.o.autoindent = true
-- Enable break indent
vim.o.breakindent = true

-- The number of spaces inserted for each indentation (default: 8)
vim.o.shiftwidth = 4
-- Insert N spaces for a tab (default: 8)
vim.o.tabstop = 4
-- Number of spaces that a tab counts for while performing editing operations
vim.o.softtabstop = 4
-- Convert tabs to spaces (default: false)
vim.o.expandtab = true

-- Show tab line if there are at least two tabs
vim.o.showtabline = 1

-- Save undo history
vim.o.undofile = true

-- the encoding written to a file
vim.o.fileencoding = 'utf-8'

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- don't insert the current comment leader automatically
vim.opt.formatoptions:remove { 'c', 'r', 'o' }

-- separate vim plugins from neovim
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles'

-- allow backspace on
vim.o.backspace = 'eol,start'

-- 파일 타입별 인덴트 설정
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"lua", "dart", "javascript", "typescript", "typescriptreact", "javascriptreact"},
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})
