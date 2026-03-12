vim.keymap.set("ia", "#!!", "#!/usr/bin/env")
vim.keymap.set("ca", "Rg", "grep")

--vim.cmd([[nnoremap <silent> j gj]])
--vim.cmd([[nnoremap <silent> k gk]])
--vim.cmd([[nnoremap <silent> l gl]])
--vim.cmd([[nnoremap <silent> ; g;]])

vim.keymap.set("n", "<Leader>w", ":write<CR>", { silent = true, desc = "Write file" })
vim.keymap.set("n", "<Leader>q", ":close<CR>", { silent = true, desc = "Close buffer" })
vim.keymap.set("n", "<Leader>Q", ":quit<CR>", { silent = true, desc = "Quit buffer" })
vim.keymap.set("n", "<Tab>", "<C-w><C-w>", { silent = true, desc = "Switch window" })

vim.keymap.set("i", "<C-h>", "<Left>", { silent = true, desc = "Move left (insert mode)" })
vim.keymap.set("i", "<C-j>", "<Down>", { silent = true, desc = "Move down (insert mode)" })
vim.keymap.set("i", "<C-k>", "<Up>", { silent = true, desc = "Move up (insert mode)" })
vim.keymap.set("i", "<C-l>", "<Right>", { silent = true, desc = "Move right (insert mode)" })

vim.keymap.set({ "n", "o" }, "H", "^", { silent = true, desc = "Move to start of line" })
vim.keymap.set({ "n", "o" }, "L", "$", { silent = true, desc = "Move to end of line" })

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true, desc = "Stop highlighting" })
vim.keymap.set("n", "<BS>", "<C-o>", { silent = true, desc = "Go to previous position" })
vim.keymap.set("v", "<C-c>", '"+y', { silent = true, desc = "Copy selection" })
vim.keymap.set("n", "p", "]p", { silent = true, desc = "Paste and indent" })
vim.keymap.set("n", "P", "]P", { silent = true, desc = "Paste and indent" })

vim.keymap.set("v", "<", "<gv", { silent = true, desc = "Re-select indented text" })
vim.keymap.set("v", ">", ">gv", { silent = true, desc = "Re-select indented text" })

-- Search by word
--vim.cmd[[nnoremap <Leader>/ \/\\<\\><Left><Left>]]
-- vim.keymap.set("n", "/", "/\\v")
-- vim.keymap.set("c", "s/", "s/\\v")
--vim.cmd([[nnoremap <silent> <Leader>t :ToggleTerm size=40 direction=float<CR>]])

--vim.cmd([[nnoremap <Leader>f :FzfLua lines<CR>]])
--vim.cmd([[nnoremap <Leader>F :FzfLua blines<CR>]])
--vim.cmd([[nnoremap <Leader>o :FzfLua files<CR>]])
-- vim.cmd([[nnoremap <Leader>y :lua require"neoclip.fzf"()<CR>]])

-- Moving text
--vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move text down'}) -- This is used for "Join Lines"
vim.keymap.set("n", "J", ":m .+1<CR>==", { silent = true, desc = "Move text down" })
vim.keymap.set("v", "K", "'<-2<CR>gv=gv", { silent = true, desc = "Move text up" })
vim.keymap.set("n", "K", ":m .-2<CR>==", { silent = true, desc = "Move text up" })

vim.keymap.set({"n", "v"}, "<Leader>s", "z=", { silent = true, desc = "Spell Suggest"})

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
	vim.keymap.set("n", "<space>F", function()
		vim.lsp.buf.format({ async = true })
	end, opts)

	vim.keymap.set("n", "<Space>e", vim.diagnostic.open_float, { silent = true, desc = "Open diagnostic float" })
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true, desc = "GoTo previous diagnostic item" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true, desc = "GoTo next diagnostic item" })
	vim.keymap.set(
		"n",
		"<Space>d",
		vim.diagnostic.setloclist,
		{ silent = true, desc = "Send diagnostics to location list" }
	)
end

vim.cmd([[:command CodeAction lua vim.lsp.buf.code_action()]])

-- vim.keymap.set("n", "]t", function()
-- 	require("todo-comments").jump_next()
-- end, { desc = "Next todo comment" })

-- vim.keymap.set("n", "[t", function()
-- 	require("todo-comments").jump_prev()
-- end, { desc = "Previous todo comment" })

-- vim.keymap.set("n", "<Leader>T", function()
-- 	vim.cmd([[:TodoQuickFix<CR>]])
-- end, { desc = "Send TODOs to QuickFix list" })

-- vim.keymap.set("n", "<Leader>tf", function()
--     vim.cmd[[:TodoFzfLua<CR>]]
-- end, { desc = "Send TODOs to Fzf" })

-- You can also specify a list of valid jump keywords

-- vim.keymap.set("n", "]t", function()
--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
-- end, { desc = "Next error/warning todo comment" })

--vim.api.nvim_set_keymap(
--	"n",
--	"<leader>rn",
--	'<cmd>lua require("renamer").rename()<cr>',
--	{ noremap = true, silent = true }
--)
--vim.api.nvim_set_keymap(
--	"v",
--	"<leader>rn",
--	'<cmd>lua require("renamer").rename()<cr>',
--	{ noremap = true, silent = true }
--)
--
--vim.keymap.set("n", "<Leader>B", require("buvvers").toggle, { desc = "Toggle buvvers window" })
