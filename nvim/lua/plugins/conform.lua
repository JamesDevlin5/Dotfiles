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

vim.keymap.set("i", "<C-S-V>", function()
	local clipboard = vim.fn.getreg("+")
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))

	-- Insert the clipboard content at cursor position
	local lines = vim.split(clipboard, "\n")
	vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, lines)

	-- Move cursor to end of pasted content
	local new_row = row - 1 + #lines - 1
	local new_col = #lines > 1 and #lines[#lines] or col + #lines[1]
	vim.api.nvim_win_set_cursor(0, { new_row + 1, new_col })

	-- Format the pasted range
	local start_mark = { row - 1, col }
	local end_mark = { new_row, new_col }

	require("conform").format({
		range = { start = start_mark, ["end"] = end_mark },
	})
end, { desc = "Paste clipboard and format" })
