return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup()

		vim.keymap.set("n", "s", "<Plug>(nvim-surround-normal)", { desc = "Add surrounding (normal)" })
		vim.keymap.set("n", "ss", "<Plug>(nvim-surround-normal-cur)", { desc = "Add surrounding (current line)" })
		vim.keymap.set("n", "S", "<Plug>(nvim-surround-normal-line)", { desc = "Add surrounding (line)" })
		vim.keymap.set("n", "SS", "<Plug>(nvim-surround-normal-cur-line)", { desc = "Add surrounding (whole line)" })
		vim.keymap.set("x", "s", "<Plug>(nvim-surround-visual)", { desc = "Add surrounding (visual)" })
		vim.keymap.set("x", "S", "<Plug>(nvim-surround-visual-line)", { desc = "Add surrounding (visual line)" })
	end,
}
