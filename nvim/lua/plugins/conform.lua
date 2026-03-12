local function paste_and_format(cmd)
	return function()
		vim.cmd("normal! " .. cmd)
		local start = vim.api.nvim_buf_get_mark(0, "[")
		local finish = vim.api.nvim_buf_get_mark(0, "]")
		require("conform").format({
			range = {
				start = start,
				["end"] = finish,
			},
		})
	end
end

vim.keymap.set("n", "p", paste_and_format("p"), { desc = "Paste and format" })
vim.keymap.set("n", "P", paste_and_format("P"), { desc = "Paste before and format" })
