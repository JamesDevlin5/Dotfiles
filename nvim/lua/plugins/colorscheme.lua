function onedark()
	return {
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").load()
		end,
		enabled = require("utils").is_vscode(),
	}
end

function lvim()
	return {
		"lvim-tech/lvim-colorscheme",
		lazy = false,
		priority = 1000,
		opts = {
			style = "dark", -- dark, darksoft, light
			styles = {
				comments = { italic = true, bold = false },
				keywords = { italic = false, bold = true },
				functions = { italic = false, bold = false },
				variables = {},
			},
			sidebars = {},
			colors = {
				dark = {},
				darksoft = {},
				light = {},
			},
		},
		enabled = require("utils").is_vscode(),
	}
end

return onedark()
-- return lvim()
