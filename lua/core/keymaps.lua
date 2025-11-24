--[[
-   NOTE      - keymaps.lua
-   Author    - zunione
-
-   Created   - 2025.10.28
-   Github    - https://github.com/zunione
-   Contact   - xt.wish1@gmail.com
]]


-- ========================= --
-- =     KEYMAP OPTIONS    =
-- ========================= --
local keyset = vim.keymap.set
local remap_opt = { remap = true }
local remap_silent_opt = { remap = true, silent = true }
local noremap_opt = { noremap = true }
local noremap_silent_opt = { noremap = true, silent = true }



-- ========================= --
-- =   GLOBAL FUNCTIONS    =
-- ========================= --
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.sync_to()
  vim.cmd([[
    !rsync -avxHAXP ~/.config/nvim/queries/* ~/Documents/nvim-dotfiles/nvim/queries/
    !rsync -avxHAXP ~/.config/nvim/ultisnips/* ~/Documents/nvim-dotfiles/nvim/ultisnips/
  ]])
  vim.api.nvim_feedkeys(t('<CR>'), 'n', true)
end

-- Function for file tree toggle
function _G.toggle_neotree()
  local manager = require("neo-tree.sources.manager")
  local state = manager.get_state("filesystem")

  if state.winid and vim.api.nvim_win_is_valid(state.winid) then
    require('neo-tree.command').execute({ action = "close" })
  else
    require('neo-tree.command').execute({ action = "focus", source = "filesystem" })
  end
end



-- ========================= --
-- =      LEADER KEY       =
-- ========================= --
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
keyset({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })



-- ========================= --
-- =      NORMAL MODE      =
-- ========================= --
keyset('n', 'dd',     '"_dd', noremap_opt)
keyset('n', 'dt',     '<CMD>lua vim.diagnostic.config({virtual_text = not vim.diagnostic.config().virtual_text})<CR>', noremap_opt)

-- Key mappings similar to VSCode
keyset('n', '<C-Q>',   '<CMD>qa<CR>', noremap_opt)
keyset('n', '<C-W>',   '<CMD>q<CR>', noremap_opt)
keyset('n', '<C-A>',   'gg<S-V>G', noremap_opt)
keyset('n', '<C-S>',   '<CMD>noautocmd w<CR>', noremap_opt) -- save file without auto-formatting
keyset('n', '<C-Z>',   'u', noremap_opt)
keyset('n', '<C-X>',   'dd', noremap_opt)
keyset('n', '<C-C>',   'yy', noremap_opt)
keyset('n', '<C-V>',   'p', noremap_opt)
keyset('n', '<C-B>',   '<CMD>lua toggle_neotree()<CR>', noremap_opt)
keyset('n', '<C-_>',   'gcc', remap_opt)



-- ========================= --
-- =      INSERT MODE      =
-- ========================= --
keyset('i', '<C-A>',    '<ESC><ESC>gg<S-V>G', noremap_opt)
keyset('i', '<C-S>',    '<ESC><ESC>:w<CR>', noremap_opt)
keyset('i', '<C-Z>',    '<ESC><ESC>ua', noremap_opt)
keyset('i', '<C-X>',    '<ESC><ESC>dda', noremap_opt)
keyset('i', '<C-C>',    '<ESC><ESC>yya', noremap_opt)
keyset('i', '<C-V>',    '<ESC><ESC>pi', noremap_opt)
keyset('i', '<C-B>',    '<CMD>lua toggle_neotree()<CR>', noremap_opt)
keyset('i', '<C-_>',    '<ESC><ESC>gcca', remap_opt)
keyset('i', '<S-TAB>',  '<C-V><TAB>', noremap_opt)



-- ========================= --
-- =      VISUAL MODE      =
-- ========================= --
keyset('v', 'd',      '"_d', noremap_opt)
keyset('v', 'c',      '"_c', noremap_opt)

keyset('v', '<BS>',     'd<ESC><ESC>i', noremap_opt)
keyset('v', '<C-A>',    '<ESC><ESC>gg<S-V>G', noremap_opt)
keyset('v', '<C-S>',    '<ESC><ESC>:w<CR>', noremap_opt)
keyset('v', '<C-Z>',    '<ESC><ESC>u', noremap_opt)
keyset('v', '<C-X>',    'd', noremap_opt)
keyset('v', '<C-C>',    'y', noremap_opt)
keyset('v', '<C-V>',    'p', noremap_opt)
keyset('v', '<C-B>',    '<CMD>lua toggle_neotree()<CR>', noremap_opt)
keyset('v', '<C-_>',    'gc', remap_opt)



-- ========================= --
-- =        BUFFERS        =
-- ========================= -- Barbar plugin: Use function keys for changing buffers
keyset({ 'n', 'i', 'v' }, '<F1>',     '<CMD>BufferGoto1<CR>', noremap_silent_opt)
keyset({ 'n', 'i', 'v' }, '<F2>',     '<CMD>BufferGoto2<CR>', noremap_silent_opt)
keyset({ 'n', 'i', 'v' }, '<F3>',     '<CMD>BufferGoto3<CR>', noremap_silent_opt)
keyset({ 'n', 'i', 'v' }, '<F4>',     '<CMD>BufferGoto4<CR>', noremap_silent_opt)
keyset({ 'n', 'i', 'v' }, '<F5>',     '<CMD>BufferGoto5<CR>', noremap_silent_opt)
keyset({ 'n', 'i', 'v' }, '<F6>',     '<CMD>BufferGoto6<CR>', noremap_silent_opt)
keyset({ 'n', 'i', 'v' }, '<F7>',     '<CMD>BufferGoto7<CR>', noremap_silent_opt)
keyset({ 'n', 'i', 'v' }, '<F8>',     '<CMD>BufferGoto8<CR>', noremap_silent_opt)
keyset({ 'n', 'i', 'v' }, '<F9>',     '<CMD>BufferGoto9<CR>', noremap_silent_opt)
keyset({ 'n', 'i', 'v' }, '<F10>',    '<CMD>BufferLast<CR>', noremap_silent_opt)



-- ========================= --
-- =         Others        =
-- ========================= --
vim.cmd([[
  nnoremap <F12> :lua require("telescope.builtin").grep_string({layout_strategy='cursor',layout_config={width=0.5, height=0.45}})<CR>
  inoremap <F12> <ESC><ESC>:lua require('telescope.builtin').grep_string({layout_strategy='cursor',layout_config={width=0.5, height=0.45}})<CR>

  vnoremap <F2>  y/<C-R>=escape(@",'/\')<CR><CR>N:%s/<C-R>=escape(@",'/\')<CR>/<C-R>=escape(@",'/\')<CR>/g<Left><Left>
  vnoremap <F3>  y/<C-R>=escape(@",'/\')<CR><CR>N

  "map <ScrollWheelLeft>  <CMD>BufferNext<CR>
  "map <ScrollWheelRight> <CMD>BufferPrevious<CR>

  ca ff Telescope find_files
  ca fg Telescope live_grep
  ca fh Telescope help_tags
  ca fb Telescope buffers
  ca fk Telescope keymaps
  ca fc Telescope commands
  ca fch Telescope command_history
  ca fsh Telescope search_history
  ca fhl Telescope highlights
  ca ww SudaWrite
  ca synct lua sync_to()
]])
