---@module "lazy"
---@type LazySpec
return {
	"numToStr/FTerm.nvim",
	opts = {},
	config = function(_, opts)
		require("FTerm").setup(opts)

		vim.keymap.set("n", "<C-`>", require("FTerm").toggle, { silent = true, desc = "Toggle the terminal" })

		-- Example: binding a terminal command
		vim.keymap.set("n", "<Leader>r", function()
			require("FTerm").run("compile.bash")
		end)
	end,
}
