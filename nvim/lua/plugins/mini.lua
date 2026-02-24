return {
	"nvim-mini/mini.nvim",
	version = false, -- use latest dev
	config = function()
        require("mini.extra").setup()
		require("mini.icons").setup()
		require("mini.pick").setup({
			mappings = {
				move_down = "<C-j>",
				move_up = "<C-k>",
			},
		})

		vim.keymap.set("v", "<C-f>", function()
			-- Yank the visual selection into the 'v' register
			vim.cmd('noau normal! "vy"')
			local selected_text = vim.fn.getreg("v")

			-- Escape the text for use as a grep pattern
			local escaped = vim.fn.escape(selected_text, "\\/.*$^~[]")

			require("mini.pick").builtin.grep({ pattern = escaped })
		end, { desc = "Search for visual selection with mini.pick" })

        vim.keymap.set("n", "<C-S-F>", MiniPick.builtin.grep_live)
        vim.keymap.set("n", "<Leader>fd", MiniExtra.pickers.diagnostic)
	end,
}
