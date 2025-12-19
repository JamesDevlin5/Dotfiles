return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	opts = {
		keymaps = {
			normal = "s",
			normal_cur = "ss",
			normal_line = "S",
			normal_cur_line = "SS",
			visual = "s",
			visual_line = "S",
		},
	},
}
