return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		npairs.setup({
			disable_in_macro = false,
			-- check_ts = true,
			-- disable_filetype = { "TelescopePrompt", "spectre_panel", "snacks_picker_input" },
		})

		local Rule = require("nvim-autopairs.rule")
		npairs.add_rule(Rule("/*", "*/", "c"))
		npairs.add_rule(Rule("(*", "*", { "ocaml", "sml" }))
		--npairs.add_rule(Rule("'", "'", "-ocaml"))
	end,
}
