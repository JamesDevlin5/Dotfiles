---@module "lazy"
---@type LazySpec
return {
	"saghen/blink.cmp",

	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"onsails/lspkind.nvim",
			lazy = true,
			config = function()
				require("lspkind").init({
					-- defines how annotations are shown
					-- default: symbol
					-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
					mode = "symbol_text",

					-- default symbol map
					-- can be either 'default' (requires nerd-fonts font) or
					-- 'codicons' for codicon preset (requires vscode-codicons font)
					--
					-- default: 'default'
					-- preset = 'codicons',
				})
			end,
		},
	},

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "enter",
			["<Tab>"] = { "show", "snippet_forward", "select_next", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
			["<C-j>"] = { "scroll_documentation_down", "select_next", "fallback" },
			["<C-k>"] = { "scroll_documentation_up", "select_prev", "fallback" },
			["<Esc>"] = { "hide_documentation", "hide_signature", "hide", "fallback" },
			["<C-h>"] = { "show_documentation" },
			["<C-s>"] = { "show_signature" },
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "normal",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			accept = { auto_brackets = { enabled = true } },
			ghost_text = { enabled = false },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
				window = { border = "rounded" },
			},
			list = {
				selection = {
					auto_insert = false,
				},
				cycle = {
					from_top = true,
					from_bottom = true,
				},
			},
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
					treesitter = { "lsp" },
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbolic(ctx.kind, {
										mode = "symbol",
									})
								end

								return icon .. ctx.icon_gap
							end,

							-- Optionally, use the highlight groups from nvim-web-devicons
							-- You can also add the same function for `kind.highlight` if you want to
							-- keep the highlight groups in sync with the icons.
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										hl = dev_hl
									end
								end
								return hl
							end,
						},
					},
				},
			},
		},

		signature = {
			enabled = true,
			window = { border = "rounded", show_documentation = false },
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = {
				"lazydev",
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
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
					min_keyword_length = 2,
					opts = {
						get_cwd = function(_)
							return vim.fn.getcwd()
						end,
					},
				},
				snippets = {
					min_keyword_length = 3,
					score_offset = -3,
				},
				buffer = {
					min_keyword_length = 3,
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

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
