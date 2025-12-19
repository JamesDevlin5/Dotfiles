return {
	"andymass/vim-matchup",
	init = function()
		vim.g.matchup_treesitter_stopline = 500
		vim.g.matchup_matchparen_offscreen = { method = "popup" }

		-- To enable the delete surrounding (ds%) and change surrounding (cs%) maps,
		vim.g.matchup_surround_enabled = true

		vim.keymap.set(
			"n",
			"<C-/>",
			":MatchupWhereAmI??<CR>",
			{ silent = true, desc = "Show current location breadcrumbs" }
		)
		-- Set the MatchParen highlight at startup (colorscheme may already be set when this is loaded)
		local function set_matchup_colo()
			vim.api.nvim_set_hl(0, "MatchParen", {
				bg = "#5a5a5a",
				underline = true,
			})
		end
		set_matchup_colo()

		-- Update MatchParen highlight on colorscheme change
		vim.api.nvim_create_augroup("vim_matchup_augroup", { clear = true })
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = "vim_matchup_augroup",
			pattern = "ColorScheme",
			callback = set_matchup_colo,
		})

		-- Deferred highlighting improves cursor movement performance (for example, when using hjkl) by delaying highlighting for a short time and waiting to see if the cursor continues moving;
		vim.g.matchup_matchparen_deferred = true
	end,
}
