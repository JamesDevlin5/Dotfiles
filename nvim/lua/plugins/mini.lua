return {
	"nvim-mini/mini.nvim",
	version = false, -- use latest dev
	config = function()
        -- Setup {{{
        -- TODO: require("mini.align").setup()
		require("mini.extra").setup()
        require("mini.bracketed").setup()
        -- TODO: require("mini.clue").setup()
        require('mini.comment').setup({
            options = {
                ignore_blank_line = true
            },
            hooks = {
                -- Print `Commented/Uncommented x lines` {{{
                post = function(params)
                    if params.action == "toggle" then return end -- optional: skip toggle

                    local count = params.line_end - params.line_start + 1
                    local label = count == 1 and "line" or "lines"
                    local verb  = params.action == "comment" and "Commented" or "Uncommented"

                    vim.notify(("%s %d %s"):format(verb, count, label), vim.log.levels.INFO)
                end,
                -- }}}
            }
        })
		require("mini.icons").setup()
        require("mini.jump").setup({
            delay = {
                idle_stop = 2000 -- cancel jump after ms
            }
        })
        require("mini.jump2d").setup({
            view = {
                dim = true,
                -- n_steps_ahead = 3
            },

            allowed_lines = {
                blank = false, -- Blank line (not sent to spotter even if `true`)
                cursor_before = false, -- Lines before cursor line
                cursor_at = true, -- Cursor line
                cursor_after = true, -- Lines after cursor line
                fold = true, -- Start of fold (not sent to spotter even if `true`)
            },

            mappings = {
                start_jumping = '<CR>'
            },

            silent = true
        })
        require("mini.pairs").setup()
		require("mini.pick").setup({
			mappings = {
				move_down = "<C-j>",
				move_up = "<C-k>",
			},
		})
        require("mini.trailspace").setup()
        -- }}}

        -- Trailspace key maps {{{
        vim.keymap.set("n", "<Leader>ft", MiniTrailspace.trim)
        -- }}}

        -- Searching key maps {{{
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
        -- }}}

        -- Spell Fix {{{
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
						local keys
						if mode == "v" then
							keys = vim.api.nvim_replace_termcodes('gv"_c' .. item .. "<Esc>", true, false, true)
						else
							keys = vim.api.nvim_replace_termcodes("ciw" .. item .. "<Esc>", true, false, true)
						end
						vim.api.nvim_feedkeys(keys, "n", false)
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
        -- }}}
	end,
}

-- vim: fdm=marker
