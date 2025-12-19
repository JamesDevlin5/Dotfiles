local file_size_strategy = function(bufnr)
	-- Disabled for very large files, global strategy for large files,
	-- local strategy otherwise
	local line_count = vim.api.nvim_buf_line_count(bufnr)
	if line_count > 10000 then
		return nil
	elseif line_count > 1000 then
		return "rainbow-delimiters.strategy.global"
	end
	return "rainbow-delimiters.strategy.local"
end

return {
	"HiPhish/rainbow-delimiters.nvim",
	main = "rainbow-delimiters.setup",
	opts = {
		strategy = {
			[""] = "rainbow-delimiters.strategy.global",
			vim = "rainbow-delimiters.strategy.local",
			cpp = file_size_strategy,
		},
		query = {
			[""] = "rainbow-delimiters",
			lua = "rainbow-blocks",
			-- Determine the query dynamically
			query = function(bufnr)
				-- Use blocks for read-only buffers like in `:InspectTree`
				local is_nofile = vim.bo[bufnr].buftype == "nofile"
				return is_nofile and "rainbow-blocks" or "rainbow-delimiters"
			end,
		},
		priority = {
			[""] = 110,
			lua = 210,
		},
		highlight = {
			"RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
			"RainbowDelimiterOrange",
			"RainbowDelimiterGreen",
			"RainbowDelimiterViolet",
			"RainbowDelimiterCyan",
		},
	},
	--[[config = function()
        -- This module contains a number of default definitions
        local rainbow_delimiters = require("rainbow-delimiters")

        ---@type rainbow_delimiters.config
        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = rainbow_delimiters.strategy["global"],
                vim = rainbow_delimiters.strategy["local"],
            },
            query = {
                [""] = "rainbow-delimiters",
                lua = "rainbow-blocks",
            },
            priority = {
                [""] = 110,
                lua = 210,
            },
            highlight = {
                "RainbowDelimiterRed",
                "RainbowDelimiterYellow",
                "RainbowDelimiterBlue",
                "RainbowDelimiterOrange",
                "RainbowDelimiterGreen",
                "RainbowDelimiterViolet",
                "RainbowDelimiterCyan",
            },
        }
    end, --]]
}
