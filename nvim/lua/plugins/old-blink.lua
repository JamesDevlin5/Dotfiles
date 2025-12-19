---@module "lazy"
---@type LazySpec
return {
	opts_extend = { "sources.default" },

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {

		keymap = {
			preset = "super-tab",
		},

		signature = {
			enabled = true,
			window = { border = "rounded", show_documentation = false },
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- Make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 1000,
				},
				lsp = {
					min_keyword_length = 2,
					score_offset = 0,
				},
				path = {
					min_keyword_length = 0,
				},
				snippets = {
					min_keyword_length = 2,
				},
				buffer = {
					min_keyword_length = 4,
					max_items = 5,
					opts = {
						get_bufnrs = function()
							return vim.tbl_filter(function(bufnr)
								return vim.bo[bufnr].buftype == ""
							end, vim.api.nvim_list_bufs())
						end,
					},
				},
			},
		},
	},
}
