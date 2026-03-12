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

		local function spell_fix(mode)
			local word
			if mode == "v" then
				-- Yank the visual selection into the 'v' register
				vim.cmd('noau normal! "vy"')
				word = vim.fn.getreg("v")
			else
				word = vim.fn.expand("<cword>")
			end

			local suggestions = vim.fn.spellsuggest(word, 35) -- max 35 suggestions

			MiniPick.start({
				source = {
					items = suggestions,
					name = "Spell Suggestions: " .. word,
					choose = function(item)
						if mode == "v" then
							-- Replace the visual selection
							vim.cmd('noau normal! gv"_c' .. item)
						else
							vim.cmd("normal! ciw" .. item)
						end
					end,
				},
			})
		end

		vim.keymap.set("n", "<Leader>s", function()
			spell_fix("n")
		end, { desc = "Spell suggest (Mini.pick)" })
		vim.keymap.set("v", "<Leader>s", function()
			spell_fix("v")
		end, { desc = "Spell suggest (visual) (Mini.pick)" })
	end,
}
