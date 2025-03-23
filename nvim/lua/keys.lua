vim.cmd([[inoreabbrev #!! #!/usr/bin/env]])
vim.cmd([[cnoreabbrev Rg grep]])

--vim.cmd([[nnoremap <silent> j gj]])
--vim.cmd([[nnoremap <silent> k gk]])
--vim.cmd([[nnoremap <silent> l gl]])
--vim.cmd([[nnoremap <silent> ; g;]])

vim.cmd([[nnoremap <silent> <Leader>w :write<CR>]])
vim.cmd([[nnoremap <silent> <Leader>q :close<CR>]])
vim.cmd([[nnoremap <silent> <Leader>Q :quit<CR>]])
vim.cmd([[nnoremap <silent> <Tab> <C-w><C-w>]])
vim.cmd([[inoremap <silent> <C-h> <left>]])
vim.cmd([[inoremap <silent> <C-j> <down>]])
vim.cmd([[inoremap <silent> <C-k> <up>]])
vim.cmd([[inoremap <silent> <C-l> <right>]])
vim.cmd([[nnoremap <silent> H ^]])
vim.cmd([[nnoremap <silent> L $]])
vim.cmd([[onoremap <silent> H ^]])
vim.cmd([[onoremap <silent> L $]])
vim.cmd([[nnoremap <silent> <Esc> :nohlsearch<CR>]])
vim.cmd([[nnoremap <silent> <BS> <C-o>]])
vim.cmd([[vnoremap <silent> <C-c> "+y]])
vim.keymap.set("n", "<Space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<Space>d", vim.diagnostic.setloclist)
-- Search by word
--vim.cmd[[nnoremap <Leader>/ \/\\<\\><Left><Left>]]
-- vim.keymap.set("n", "/", "/\\v")
-- vim.keymap.set("c", "s/", "s/\\v")
vim.cmd([[nnoremap <silent> <Leader>t :ToggleTerm size=40 direction=float<CR>]])

vim.cmd([[nnoremap <Leader>f :FzfLua lines<CR>]])
vim.cmd([[nnoremap <Leader>F :FzfLua blines<CR>]])
vim.cmd([[nnoremap <Leader>o :FzfLua files<CR>]])
-- vim.cmd([[nnoremap <Leader>y :lua require"neoclip.fzf"()<CR>]])

-- Moving text
--vim.cmd([[vnoremap J :m '>+1<CR>gv=gv]])
vim.cmd([[vnoremap K :m '<-2<CR>gv=gv]])
vim.cmd([[nnoremap J :m .+1<CR>==]])
vim.cmd([[nnoremap K :m .-2<CR>==]])

function lsp_attach_keys(ev)
	-- Buffer local mappings.
	local opts = { buffer = ev.buf }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
end

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "<Leader>T", function()
    vim.cmd[[:TodoQuickFix<CR>]]
end, { desc = "Send TODOs to QuickFix list" })

-- vim.keymap.set("n", "<Leader>tf", function()
--     vim.cmd[[:TodoFzfLua<CR>]]
-- end, { desc = "Send TODOs to Fzf" })

-- You can also specify a list of valid jump keywords

-- vim.keymap.set("n", "]t", function()
--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
-- end, { desc = "Next error/warning todo comment" })

vim.api.nvim_set_keymap(
    "n",
    "<leader>rn",
    '<cmd>lua require("renamer").rename()<cr>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "v",
    "<leader>rn",
    '<cmd>lua require("renamer").rename()<cr>',
    { noremap = true, silent = true }
)

vim.keymap.set("n", "<Leader>B", require'buvvers'.toggle, { desc = "Toggle buvvers window"})
