-- Keymap
local map = vim.api.nvim_set_keymap

-- <Leader> = Space
map( "n", "<Space>", "", {} )
vim.g.mapleader = " "

local options = { noremap = true }

map( "n", "<Leader><Esc>", ":nohlsearch<CR>", options )
map( "n", "<Leader>n", ":bnext<CR>", options )
map( "n", "<Leader>p", ":bprev<CR>", options )
map('n', '<Leader>ec', ':edit $MYVIMRC<CR>', options)

map( "n", "<Leader>u", ":UndotreeToggle<CR>", options )

map('n', '<Leader>a', '<Plug>(EasyAlign)', options)
map('x', '<Leader>a', '<Plug>(EasyAlign)', options)

-- map('n', '<Leader>ss', '<C-u>SessionSave<CR>', options)
-- map('n', '<Leader>sl', '<C-u>SessionLoad<CR>', options)
--[[
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
--]]

map( "n", "<Leader>j", ":AnyJump<CR>", options )
map( "n", "<Leader>J", ":AnyJumpBack<CR>", options )
map( "v", "<Leader>j", ":AnyJumpVisual<CR>", options )

map('n', '<Leader>t', ':NvimTreeToggle<CR>', options)

--map('n', '<Leader>w', '<Plug>(choosewin)', options)
map('n', '<Leader>w', ':ChooseWin<CR>', options)

map('n', '<Leader>f', ':Neoformat<CR>', options)

--[[ TODO: fix
-- Yoink must be notified when a paste has occurred, to allow choosing an item to paste
map( "n", "p", "<plug>(YoinkPaste_p)", options )
map( "n", "P", "<plug>(YoinkPaste_P)", options )
map( "n", "gp", "<plug>(YoinkPaste_gp)", options )
map( "n", "gP", "<plug>(YoinkPaste_gP)", options )

map( "n", "<C-n>", "<plug>(YoinkPostPasteSwapBack)", options )
map( "n", "<C-p>", "<plug>(YoinkPostPasteSwapForward)", options )

-- Toggle formatting of pasted content
map( "n", "<C-=>", "<plug>(YoinkPostPasteToggleFormat)", options )

map( "n", "y", "<plug>(YoinkYankPreserveCursorPosition)", options )
map( "x", "y", "<plug>(YoinkYankPreserveCursorPosition)", options )
]]

options = nil

