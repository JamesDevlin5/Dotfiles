-- Lazy Plugin Manager {{{

-- Install lazy if not already {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- }}}

require("lazy").setup({
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").load()
		end,
	},
	{
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
		enabled = false,
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				-- Theme List: https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md
				-- theme = "onedark"
				theme = "horizon",
				padding = 2,
				globalstatus = true,
				-- component_separators = { '', '' },
				-- section_separators = { '', '' },
				disabled_filetypes = { "help", "dashboard", "telescope", "scratch" },
			},
			sections = {
				lualine_c = {
					"filename",
					function()
						return require("lsp-progress").progress()
					end,
				},
				lualine_x = {
					{
						"searchcount",
						maxcount = 999,
						timeout = 500,
					},
					"filetype",
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
			},
			tabline = {
				lualine_a = {
					{
						"buffers",
						separator = { left = "", right = "" },
						right_padding = 2,
						symbols = { alternate_file = "" },
					},
				},
			},
		},
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "NotifyBackground",
				fps = 30,
				icons = {
					DEBUG = "",
					ERROR = "",
					INFO = "",
					TRACE = "✎",
					WARN = "",
				},
				level = 2,
				minimum_width = 50,
				render = "default",
				stages = "slide",
				time_formats = {
					notification = "%T",
					notification_history = "%FT%T",
				},
				timeout = 5000,
				top_down = true,
			})
			vim.notify = require("notify")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({})

			local Rule = require("nvim-autopairs.rule")
			npairs.add_rule(Rule("/*", "*/", "c"))
			npairs.add_rule(Rule("(*", "*", { "ocaml", "sml" }))
			--npairs.add_rule(Rule("'", "'", "-ocaml"))
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			-- ignore empty lines
			ignore = "^$",
		},
	},
	{
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
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		opts = {
			region_check_events = "CursorMoved",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			cmp.setup({
				preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "luasnip" },
				}),
				sorting = {
					comparators = {
						cmp.config.compare.sort_text,
						cmp.config.compare.recently_used,
						-- require("clangd_extensions.cmp_scores"),
						cmp.config.compare.locality,
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.kind,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
				enabled = function()
					-- Disable completion in comments
					local context = require("cmp.config.context")
					-- Complete within comment if in command mode
					if vim.api.nvim_get_mode().mode == "c" then
						return true
					else
						return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
					end
				end,
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.scroll_docs(-4),
					["<C-j>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-Space"] = cmp.mapping(function(cmp)
						cmp.show({
							providers = { "lsp" },
						})
					end, { "i", "s" }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif not cmp.select_next_item() then
							if vim.bo.buftype ~= "prompt" and has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						elseif not cmp.select_prev_item() then
							if vim.bo.buftype ~= "prompt" and has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end
					end, { "i", "s" }),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = false,
					}),
				}),
			})

			-- Searching (`/` or `?`)
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Command line (`:`)
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				enabled = function()
					local disabled = {
						IncRename = true,
					}
					-- Get first word
					local cmd = vim.fn.getcmdline():match("%S+")
					return not disabled[cmd] or cmp.close()
				end,
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"rust",
					"toml",
					"c",
					"bash",
					"python",
					"go",
					"markdown",
					"comment",
					"cpp",
					"make",
					"markdown",
					"markdown_inline",
				},
				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,
				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,
				-- List of parsers to ignore installing (or "all")
				--ignore_install = { "javascript" },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				},
				matchup = {
					enable = true,
					disable = {},
					include_match_words = true,
				},
			})
		end,
	},
	-- {
	--     "pmizio/typescript-tools.nvim",
	--     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	--     opts = {},
	-- },
	{
		"williamboman/mason.nvim",
		config = function()
			local servers = {
				"bashls",
				-- "black",
				"clangd",
				"jsonls",
				"lua_ls",
				"marksman",
				"pyright",
				--"rust_analyzer",
				"taplo",
				-- "ocamllsp",
				-- "ts_ls",
			}

			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = servers,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			for _, lsp in ipairs(servers) do
				if lsp == "lua_ls" then
					lspconfig[lsp].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								workspace = {
									library = vim.tbl_extend(
										"keep",
										-- this will probably vary depending on setup, not sure if plugins like mason even install it.
										{ "/usr/lib/lua-language-server/meta/template" },
										-- and runtime-directories.
										vim.api.nvim_get_runtime_file("", true)
									),
								},
							},
						},
					})
				elseif lsp == "bashls" then
					lspconfig[lsp].setup({
						capabilities = capabilities,
						filetypes = {
							"sh",
							"bash",
							"zsh",
						},
					})
				elseif lsp == "black" then
					-- nothing
				elseif lsp == "clangd" then
					lspconfig[lsp].setup({
						capabilities = capabilities,
						keys = {
							{
								"<leader>ch",
								"<cmd>ClangdSwitchSourceHeader<cr>",
								desc = "Switch Source/Header (C/C++)",
							},
						},
						cmd = {
							"clangd",
							"--background-index",
							"--clang-tidy",
							"--header-insertion=iwyu",
							"--completion-style=detailed",
							"--function-arg-placeholders",
							"--fallback-style=llvm",
						},
						init_options = {
							usePlaceholders = true,
							completeUnimported = true,
							clangdFileStatus = true,
						},
					})
					-- require("clangd_extensions.inlay_hints").setup_autocmd()
					-- require("clangd_extensions.inlay_hints").set_inlay_hints()
				elseif lsp == "rust_analyzer" then
					--lspconfig[lsp].setup({
					--	capabilities = capabilities,
					--	settings = {
					--		["rust-analyzer"] = {
					--			check = {
					--				command = "clippy",
					--			},
					--			diagnostics = {
					--				enable = true,
					--			},
					--		},
					--	},
					--})
				elseif lsp == "ocamllsp" then
					lspconfig[lsp].setup({
						cmd = { "ocamllsp" },
						filetypes = {
							"ocaml",
							"ocaml.menhir",
							"ocaml.interface",
							"ocaml.ocamllex",
							"reason",
							"dune",
						},
						root_dir = lspconfig.util.root_pattern(
							"*.opam",
							"esy.json",
							"package.json",
							".git",
							"dune-project",
							"dune-workspace"
						),
						capabilities = capabilities,
					})
					--vim.cmd[[rtp^=~/.opam/default/share/ocp-indent/vim]]
				else
					lspconfig[lsp].setup({
						capabilities = capabilities,
					})
				end

				vim.lsp.handlers["textDocument/publishDiagnostics"] =
					vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
						virtual_text = true,
					})

				-- vim.api.nvim_create_autocmd({'InsertEnter'}, {
				--     callback = function() vim.lsp.buf.inlay_hint(0, true) end
				-- })
				-- vim.api.nvim_create_autocmd({'InsertLeave'}, {
				--     callback = function() vim.lsp.buf.inlay_hint(0, false) end
				-- })
			end
		end,
	},
	{
		"p00f/clangd_extensions.nvim",
		ft = { "c", "cpp" },
		opts = {
			-- inlay_hints = {
			-- 	inline = true,
			-- },
			ast = {
				--These require codicons (https://github.com/microsoft/vscode-codicons)
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},
				kind_icons = {
					Compound = "",
					Recovery = "",
					TranslationUnit = "",
					PackExpansion = "",
					TemplateTypeParm = "",
					TemplateTemplateParm = "",
					TemplateParamObject = "",
				},
			},
		},
		enable = false,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		ft = { "rust" },
		lazy = false, -- This plugin is already lazy
		config = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzer"] = {
							check = {
								command = "clippy",
							},
							diagnostics = {
								enable = true,
							},
						},
					},
					on_attach = function(client, bufnr)
						vim.keymap.set("n", "<leader>a", function()
							vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
							-- or vim.lsp.buf.codeAction() if you don't want grouping.
						end, { silent = true, buffer = bufnr })
						vim.keymap.set(
							"n",
							"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
							function()
								vim.cmd.RustLsp({ "hover", "actions" })
							end,
							{ silent = true, buffer = bufnr }
						)
					end,
				},
			}
		end,
	},
	{
		"ray-x/go.nvim",
		config = function()
			require("go").setup()
		end,
		ft = { "go", "gomod" },
		--build = ':lua require("go.install").update_all_sync()'
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		-- opts = {
		--     diagnostics = {
		--         signs = {
		--             text = {
		--                 [vim.diagnostic.severity.ERROR] = "",
		--                 [vim.diagnostic.severity.WARN] = "",
		--                 [vim.diagnostic.severity.HINT] = "",
		--                 [vim.diagnostic.severity.INFO] = "",
		--             },
		--             numhl = {
		--                 [vim.diagnostic.severity.WARN] = "WarningMsg",
		--                 [vim.diagnostic.severity.ERROR] = "ErrorMsg",
		--                 [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
		--                 [vim.diagnostic.severity.HINT] = "DiagnosticHint",
		--             },
		--         },
		--     },
		-- },
	},
	{ "folke/neodev.nvim", opts = {}, ft = { "lua" }, enabled = false },
	{
		"yamatsum/nvim-cursorline",
		opts = {
			cursorline = {
				enable = true,
				timeout = 1000,
				number = false,
			},
			cursorword = {
				enable = true,
				min_length = 3,
				hl = { underline = true },
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			-- yadm = {
			-- 	enable = false,
			-- },
			on_attach = function(client, bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk)
				map("n", "<leader>hr", gs.reset_hunk)
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("n", "<leader>hS", gs.stage_buffer)
				map("n", "<leader>hu", gs.undo_stage_hunk)
				map("n", "<leader>hR", gs.reset_buffer)
				map("n", "<leader>hp", gs.preview_hunk)
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end)
				map("n", "<leader>tb", gs.toggle_current_line_blame)
				map("n", "<leader>hd", gs.diffthis)
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end)
				map("n", "<leader>td", gs.toggle_deleted)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")

				-- format on save
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Format", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.formatting_seq_sync()
						end,
					})
				end
			end,
		},
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			-- size can be a number or function which is passed the current terminal
			size = 20, --[[| function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end]] --
			open_mapping = [[<c-`>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
			-- on_create = fun(t: Terminal), -- function to run when the terminal is first created
			-- on_open = fun(t: Terminal), -- function to run when the terminal opens
			-- on_close = fun(t: Terminal), -- function to run when the terminal closes
			-- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
			-- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
			-- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
			hide_numbers = true, -- hide the number column in toggleterm buffers
			-- shade_filetypes = {},
			autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
			-- highlights = {
			--     -- highlights which map to a highlight group name and a table of it's values
			--     -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
			--     Normal = {
			--         guibg = "<VALUE-HERE>",
			--     },
			--     NormalFloat = {
			--         link = 'Normal'
			--     },
			--     FloatBorder = {
			--         guifg = "<VALUE-HERE>",
			--         guibg = "<VALUE-HERE>",
			--     },
			-- },
			shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
			shading_factor = "-20", -- the percentage by which to lighten dark terminal background, default: -30
			-- shading_ratio = '<number>', -- the ratio of shading factor for light/dark terminal background, default: -3
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float',
			close_on_exit = true, -- close the terminal window when the process exits
			-- Change the default shell. Can be a string or a function returning a string
			shell = vim.o.shell,
			auto_scroll = true, -- automatically scroll to the bottom on terminal output
			-- This field is only relevant if direction is set to 'float'
			float_opts = {
				-- The border key is *almost* the same as 'nvim_open_win'
				-- see :h nvim_open_win for details on borders however
				-- the 'curved' border is a custom border type
				-- not natively supported but implemented in this plugin.
				border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
				-- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
				-- width = <value>,
				-- height = <value>,
				-- row = <value>,
				-- col = <value>,
				-- winblend = 3,
				-- zindex = <value>,
				title_pos = "center", -- 'left' | 'center' | 'right', position of the title of the floating window
			},
			winbar = {
				enabled = false,
				name_formatter = function(term) --  term: Terminal
					return term.name
				end,
			},
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
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
		end,
	},
	{
		"m-demare/hlargs.nvim",
		opts = {
			color = "#ef9062",
			paint_catch_blocks = {
				declarations = true,
				usages = true,
			},
			excluded_argnames = {
				declarations = {},
				usages = {
					python = { "self", "cls" },
					lua = { "self" },
				},
			},
		},
	},
	{
		"filipdutescu/renamer.nvim",
		main = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local mappings_utils = require("renamer.mappings.utils")
			opts = {
				-- The popup title, shown if `border` is true
				title = "Rename",
				-- The padding around the popup content
				padding = {
					top = 0,
					left = 2,
					bottom = 0,
					right = 2,
				},
				-- The minimum width of the popup
				min_width = 15,
				-- The maximum width of the popup
				max_width = 45,
				-- Whether or not to shown a border around the popup
				border = true,
				-- The characters which make up the border
				border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				-- Whether or not to highlight the current word references through LSP
				show_refs = true,
				-- Whether or not to add resulting changes to the quickfix list
				with_qf_list = true,
				-- Whether or not to enter the new name through the UI or Neovim's `input`
				-- prompt
				with_popup = true,
				-- The keymaps available while in the `renamer` buffer. The example below
				-- overrides the default values, but you can add others as well.
				mappings = {
					["<c-i>"] = mappings_utils.set_cursor_to_start,
					["<c-a>"] = mappings_utils.set_cursor_to_end,
					["<c-e>"] = mappings_utils.set_cursor_to_word_end,
					["<c-b>"] = mappings_utils.set_cursor_to_word_start,
					["<c-c>"] = mappings_utils.clear_line,
					["<c-u>"] = mappings_utils.undo,
					["<c-r>"] = mappings_utils.redo,
				},
				-- Custom handler to be run after successfully renaming the word. Receives
				-- the LSP 'textDocument/rename' raw response as its parameter.
				handler = nil,
			}
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = true, -- show icons in the signs column
			sign_priority = 8, -- sign priority
			-- keywords recognized as todo comments
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
			merge_keywords = true, -- when true, custom keywords will be merged with the defaults
			-- highlighting of the line containing the todo comment
			-- * before: highlights before the keyword (typically comment characters)
			-- * keyword: highlights of the keyword
			-- * after: highlights after the keyword (todo text)
			highlight = {
				multiline = true, -- enable multine todo comments
				multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
				multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
				before = "", -- "fg" or "bg" or empty
				keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
				after = "fg", -- "fg" or "bg" or empty
				pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
				comments_only = true, -- uses treesitter to match keywords in comments only
				max_line_len = 400, -- ignore lines longer than this
				exclude = {}, -- list of file types to exclude highlighting
			},
			-- list of named colors where we try to extract the guifg from the
			-- list of highlight groups or use the hex color if hl not found as a fallback
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
				test = { "Identifier", "#FF00FF" },
			},
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
				-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			},
		},
	},
	{
		"linrongbin16/lsp-progress.nvim",
		config = function()
			require("lsp-progress").setup({})
			-- listen lsp-progress event and refresh lualine
			vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
			vim.api.nvim_create_autocmd("User", {
				group = "lualine_augroup",
				pattern = "LspProgressStatusUpdated",
				callback = require("lualine").refresh,
			})
		end,
	},
	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
			-- To enable the delete surrounding (ds%) and change surrounding (cs%) maps,
			vim.g.matchup_surround_enabled = 1

			-- Set the MatchParen highlight at startup (colorscheme may already be set when this is loaded)
			local function set_matchup_colo()
				vim.cmd([[hi MatchParen guibg=#5a5a5a]])
			end
			set_matchup_colo()

			-- Update MatchParen highlight on colorscheme change
			vim.api.nvim_create_augroup("vim_matchup_augroup", { clear = true })
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = "vim_matchup_augroup",
				pattern = "ColorScheme",
				callback = set_matchup_colo,
			})
		end,
	},
	{
		"aidancz/buvvers.nvim",
		opts = {
			-- Take focus when window opens
			buvvers_win_enter = true,
			-- set filetype
			buvvers_buf_opt = {
				filetype = "buvvers",
			},
			buffer_handle_list_to_buffer_name_list = function(handle_l)
				local name_l

				local default_function = require("buvvers.buffer_handle_list_to_buffer_name_list")
				name_l = default_function(handle_l)

				for n, name in ipairs(name_l) do
					local is_modified = vim.api.nvim_get_option_value("modified", { buf = handle_l[n] })
					local prefix
					if is_modified then
						prefix = "[+]"
					else
						prefix = "[ ]"
					end
					name_l[n] = {
						prefix,
						" ",
						name,
					}
				end

				return name_l
			end,
		},
	},
})

-- }}}

-- vim:fdm=marker
