-- Lazy Plugin Manager {{{

-- Install lazy if not already {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)
-- }}}

require("lazy").setup {
    require("plugins.blink"),
    require("plugins.colorscheme"),
    require("plugins.cursorline"),
    require("plugins.formatters"),
    require("plugins.gitsigns"),
    require("plugins.harpoon"),
    require("plugins.lazydev"),
    require("plugins.lsp"),
    require("plugins.lualine"),
    require("plugins.markdown"),
    require("plugins.matchup"),
    require("plugins.mini"),
    require("plugins.notify"),
    require("plugins.rainbow-delims"),
    require("plugins.statuscol"),
    require("plugins.surround"),
    require("plugins.terminal"),
    require("plugins.todo-comments"),
    require("plugins.treesitter"),
    require("plugins.treesitter-context"),
    {
        dir = "/home/james/workspace/makefile-targets.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "echasnovski/mini.pick" },
        ---@type MakefileTargetsOpts
        opts = {
            make_args = "-j4",
        },
        keys = {
            {
                "<Leader>m",
                function()
                    require("makefile-targets.core").pick_target()
                end,
                desc = "Make: pick target",
            },
            {
                "<Leader>M",
                function()
                    require("makefile-targets.core").pick_target { make_args = "-n" }
                end,
                desc = "Make: pick target (dry run)",
            },
            {
                "<Leader>mt",
                function()
                    require("makefile-targets.telescope").pick_target()
                end,
                desc = "Make: pick target (Telescope)",
            },
            {
                "<Leader>mm",
                function()
                    require("makefile-targets.mini").pick_target()
                end,
                desc = "Make: pick target (Mini.pick)",
            },
        },
    },
    --	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    --  {{{
    --	{
    --		"ibhagwan/fzf-lua",
    --		dependencies = { "nvim-tree/nvim-web-devicons" },
    --		opts = {},
    --	},
    --	}}}
    --	{{{
    --	{
    --		"hrsh7th/nvim-cmp",
    --		-- load cmp on InsertEnter
    --		event = "InsertEnter",
    --		dependencies = {
    --			"hrsh7th/cmp-nvim-lsp",
    --			"hrsh7th/cmp-buffer",
    --			"hrsh7th/cmp-path",
    --			"hrsh7th/cmp-cmdline",
    --			"hrsh7th/cmp-nvim-lsp-signature-help",
    --		},
    --		config = function()
    --			local has_words_before = function()
    --				unpack = unpack or table.unpack
    --				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --				return col ~= 0
    --					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    --			end
    --			local cmp = require("cmp")
    --			local luasnip = require("luasnip")
    --			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    --			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    --
    --			cmp.setup({
    --				preselect = cmp.PreselectMode.None,
    --				snippet = {
    --					expand = function(args)
    --						luasnip.lsp_expand(args.body)
    --					end,
    --				},
    --				window = {
    --					completion = cmp.config.window.bordered(),
    --					documentation = cmp.config.window.bordered(),
    --				},
    --				sources = cmp.config.sources({
    --					{ name = "nvim_lsp" },
    --					{ name = "buffer" },
    --					{ name = "nvim_lsp_signature_help" },
    --					{ name = "luasnip" },
    --				}),
    --				sorting = {
    --					comparators = {
    --						cmp.config.compare.sort_text,
    --						cmp.config.compare.recently_used,
    --						-- require("clangd_extensions.cmp_scores"),
    --						cmp.config.compare.locality,
    --						cmp.config.compare.offset,
    --						cmp.config.compare.exact,
    --						cmp.config.compare.score,
    --						cmp.config.compare.kind,
    --						cmp.config.compare.length,
    --						cmp.config.compare.order,
    --					},
    --				},
    --				enabled = function()
    --					-- Disable completion in comments
    --					local context = require("cmp.config.context")
    --					-- Complete within comment if in command mode
    --					if vim.api.nvim_get_mode().mode == "c" then
    --						return true
    --					else
    --						return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
    --					end
    --				end,
    --				mapping = cmp.mapping.preset.insert({
    --					["<C-k>"] = cmp.mapping.scroll_docs(-4),
    --					["<C-j>"] = cmp.mapping.scroll_docs(4),
    --					["<C-e>"] = cmp.mapping.abort(),
    --					["<C-Space"] = cmp.mapping(function(cmp)
    --						cmp.show({
    --							providers = { "lsp" },
    --						})
    --					end, { "i", "s" }),
    --					["<Tab>"] = cmp.mapping(function(fallback)
    --						if luasnip.expand_or_jumpable() then
    --							luasnip.expand_or_jump()
    --						elseif not cmp.select_next_item() then
    --							if vim.bo.buftype ~= "prompt" and has_words_before() then
    --								cmp.complete()
    --							else
    --								fallback()
    --							end
    --						end
    --					end, { "i", "s" }),
    --					["<S-Tab>"] = cmp.mapping(function(fallback)
    --						if luasnip.jumpable(-1) then
    --							luasnip.jump(-1)
    --						elseif not cmp.select_prev_item() then
    --							if vim.bo.buftype ~= "prompt" and has_words_before() then
    --								cmp.complete()
    --							else
    --								fallback()
    --							end
    --						end
    --					end, { "i", "s" }),
    --					["<CR>"] = cmp.mapping.confirm({
    --						behavior = cmp.ConfirmBehavior.Insert,
    --						select = false,
    --					}),
    --				}),
    --			})
    --
    --			-- Searching (`/` or `?`)
    --			cmp.setup.cmdline({ "/", "?" }, {
    --				mapping = cmp.mapping.preset.cmdline(),
    --				sources = {
    --					{ name = "buffer" },
    --				},
    --			})
    --
    --			-- Command line (`:`)
    --			cmp.setup.cmdline(":", {
    --				mapping = cmp.mapping.preset.cmdline(),
    --				enabled = function()
    --					local disabled = {
    --						IncRename = true,
    --					}
    --					-- Get first word
    --					local cmd = vim.fn.getcmdline():match("%S+")
    --					return not disabled[cmd] or cmp.close()
    --				end,
    --				sources = cmp.config.sources({
    --					{ name = "path" },
    --				}, {
    --					{ name = "cmdline" },
    --				}),
    --			})
    --		end,
    --	},
    --	}}}
    --	{{{
    --	{
    --		"williamboman/mason.nvim",
    --		config = function()
    --			local servers = {
    --				"bashls",
    --				-- "black",
    --				"clangd",
    --				"jsonls",
    --				"lua_ls",
    --				"marksman",
    --				"pyright",
    --				--"rust_analyzer",
    --				"taplo",
    --				-- "ocamllsp",
    --				-- "ts_ls",
    --			}
    --
    --			require("mason").setup()
    --			require("mason-lspconfig").setup({
    --				automatic_installation = true,
    --				ensure_installed = servers,
    --			})
    --
    --			local capabilities = require("cmp_nvim_lsp").default_capabilities()
    --			local lspconfig = require("lspconfig")
    --
    --			for _, lsp in ipairs(servers) do
    --				if lsp == "lua_ls" then
    --					lspconfig[lsp].setup({
    --						capabilities = capabilities,
    --						settings = {
    --							Lua = {
    --								workspace = {
    --									library = vim.tbl_extend(
    --										"keep",
    --										-- this will probably vary depending on setup, not sure if plugins like mason even install it.
    --										{ "/usr/lib/lua-language-server/meta/template" },
    --										-- and runtime-directories.
    --										vim.api.nvim_get_runtime_file("", true)
    --									),
    --								},
    --							},
    --						},
    --					})
    --				elseif lsp == "bashls" then
    --					lspconfig[lsp].setup({
    --						capabilities = capabilities,
    --						filetypes = {
    --							"sh",
    --							"bash",
    --							"zsh",
    --						},
    --					})
    --				elseif lsp == "black" then
    --					-- nothing
    --				elseif lsp == "clangd" then
    --					lspconfig[lsp].setup({
    --						capabilities = capabilities,
    --						keys = {
    --							{
    --								"<leader>ch",
    --								"<cmd>ClangdSwitchSourceHeader<cr>",
    --								desc = "Switch Source/Header (C/C++)",
    --							},
    --						},
    --						cmd = {
    --							"clangd",
    --							"--background-index",
    --							"--clang-tidy",
    --							"--header-insertion=iwyu",
    --							"--completion-style=detailed",
    --							"--function-arg-placeholders",
    --							"--fallback-style=llvm",
    --						},
    --						init_options = {
    --							usePlaceholders = true,
    --							completeUnimported = true,
    --							clangdFileStatus = true,
    --						},
    --					})
    --					-- require("clangd_extensions.inlay_hints").setup_autocmd()
    --					-- require("clangd_extensions.inlay_hints").set_inlay_hints()
    --				elseif lsp == "rust_analyzer" then
    --					--lspconfig[lsp].setup({
    --					--	capabilities = capabilities,
    --					--	settings = {
    --					--		["rust-analyzer"] = {
    --					--			check = {
    --					--				command = "clippy",
    --					--			},
    --					--			diagnostics = {
    --					--				enable = true,
    --					--			},
    --					--		},
    --					--	},
    --					--})
    --				elseif lsp == "ocamllsp" then
    --					lspconfig[lsp].setup({
    --						cmd = { "ocamllsp" },
    --						filetypes = {
    --							"ocaml",
    --							"ocaml.menhir",
    --							"ocaml.interface",
    --							"ocaml.ocamllex",
    --							"reason",
    --							"dune",
    --						},
    --						root_dir = lspconfig.util.root_pattern(
    --							"*.opam",
    --							"esy.json",
    --							"package.json",
    --							".git",
    --							"dune-project",
    --							"dune-workspace"
    --						),
    --						capabilities = capabilities,
    --					})
    --					--vim.cmd[[rtp^=~/.opam/default/share/ocp-indent/vim]]
    --				else
    --					lspconfig[lsp].setup({
    --						capabilities = capabilities,
    --					})
    --				end
    --
    --				vim.lsp.handlers["textDocument/publishDiagnostics"] =
    --					vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    --						virtual_text = true,
    --					})
    --
    --				-- vim.api.nvim_create_autocmd({'InsertEnter'}, {
    --				--     callback = function() vim.lsp.buf.inlay_hint(0, true) end
    --				-- })
    --				-- vim.api.nvim_create_autocmd({'InsertLeave'}, {
    --				--     callback = function() vim.lsp.buf.inlay_hint(0, false) end
    --				-- })
    --			end
    --		end,
    --	},
    --	}}}
    --	{{{
    --	{
    --		"p00f/clangd_extensions.nvim",
    --		ft = { "c", "cpp" },
    --		opts = {
    --			-- inlay_hints = {
    --			-- 	inline = true,
    --			-- },
    --			ast = {
    --				--These require codicons (https://github.com/microsoft/vscode-codicons)
    --				role_icons = {
    --					type = "",
    --					declaration = "",
    --					expression = "",
    --					specifier = "",
    --					statement = "",
    --					["template argument"] = "",
    --				},
    --				kind_icons = {
    --					Compound = "",
    --					Recovery = "",
    --					TranslationUnit = "",
    --					PackExpansion = "",
    --					TemplateTypeParm = "",
    --					TemplateTemplateParm = "",
    --					TemplateParamObject = "",
    --				},
    --			},
    --		},
    --		enable = false,
    --	},
    --	{
    --		"mrcjkb/rustaceanvim",
    --		version = "^5",
    --		ft = { "rust" },
    --		lazy = false, -- This plugin is already lazy
    --		config = function()
    --			vim.g.rustaceanvim = {
    --				server = {
    --					default_settings = {
    --						["rust-analyzer"] = {
    --							check = {
    --								command = "clippy",
    --							},
    --							diagnostics = {
    --								enable = true,
    --							},
    --						},
    --					},
    --					on_attach = function(client, bufnr)
    --						vim.keymap.set("n", "<leader>a", function()
    --							vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
    --							-- or vim.lsp.buf.codeAction() if you don't want grouping.
    --						end, { silent = true, buffer = bufnr })
    --						vim.keymap.set(
    --							"n",
    --							"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    --							function()
    --								vim.cmd.RustLsp({ "hover", "actions" })
    --							end,
    --							{ silent = true, buffer = bufnr }
    --						)
    --					end,
    --				},
    --			}
    --		end,
    --	},
    --	{
    --		"ray-x/go.nvim",
    --		config = function()
    --			require("go").setup()
    --		end,
    --		ft = { "go", "gomod" },
    --		--build = ':lua require("go.install").update_all_sync()'
    --	},
    --	}}}
    --	{{{
    --	{ "williamboman/mason-lspconfig.nvim" },
    --	{
    --		"neovim/nvim-lspconfig",
    --		-- opts = {
    --		--     diagnostics = {
    --		--         signs = {
    --		--             text = {
    --		--                 [vim.diagnostic.severity.ERROR] = "",
    --		--                 [vim.diagnostic.severity.WARN] = "",
    --		--                 [vim.diagnostic.severity.HINT] = "",
    --		--                 [vim.diagnostic.severity.INFO] = "",
    --		--             },
    --		--             numhl = {
    --		--                 [vim.diagnostic.severity.WARN] = "WarningMsg",
    --		--                 [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    --		--                 [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
    --		--                 [vim.diagnostic.severity.HINT] = "DiagnosticHint",
    --		--             },
    --		--         },
    --		--     },
    --		-- },
    --	},
    --	}}}
    --	{{{
    --	{
    --		"m-demare/hlargs.nvim",
    --		opts = {
    --			color = "#ef9062",
    --			paint_catch_blocks = {
    --				declarations = true,
    --				usages = true,
    --			},
    --			excluded_argnames = {
    --				declarations = {},
    --				usages = {
    --					python = { "self", "cls" },
    --					lua = { "self" },
    --				},
    --			},
    --		},
    --	},
    --	}}}
    --	{{{
    --	{
    --		"filipdutescu/renamer.nvim",
    --		main = "master",
    --		dependencies = { "nvim-lua/plenary.nvim" },
    --		config = function()
    --			local mappings_utils = require("renamer.mappings.utils")
    --			opts = {
    --				-- The popup title, shown if `border` is true
    --				title = "Rename",
    --				-- The padding around the popup content
    --				padding = {
    --					top = 0,
    --					left = 2,
    --					bottom = 0,
    --					right = 2,
    --				},
    --				-- The minimum width of the popup
    --				min_width = 15,
    --				-- The maximum width of the popup
    --				max_width = 45,
    --				-- Whether or not to shown a border around the popup
    --				border = true,
    --				-- The characters which make up the border
    --				border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    --				-- Whether or not to highlight the current word references through LSP
    --				show_refs = true,
    --				-- Whether or not to add resulting changes to the quickfix list
    --				with_qf_list = true,
    --				-- Whether or not to enter the new name through the UI or Neovim's `input`
    --				-- prompt
    --				with_popup = true,
    --				-- The keymaps available while in the `renamer` buffer. The example below
    --				-- overrides the default values, but you can add others as well.
    --				mappings = {
    --					["<c-i>"] = mappings_utils.set_cursor_to_start,
    --					["<c-a>"] = mappings_utils.set_cursor_to_end,
    --					["<c-e>"] = mappings_utils.set_cursor_to_word_end,
    --					["<c-b>"] = mappings_utils.set_cursor_to_word_start,
    --					["<c-c>"] = mappings_utils.clear_line,
    --					["<c-u>"] = mappings_utils.undo,
    --					["<c-r>"] = mappings_utils.redo,
    --				},
    --				-- Custom handler to be run after successfully renaming the word. Receives
    --				-- the LSP 'textDocument/rename' raw response as its parameter.
    --				handler = nil,
    --			}
    --		end,
    --	},
    --	}}}
    --	{{{
    --	{
    --		"aidancz/buvvers.nvim",
    --		opts = {
    --			-- Take focus when window opens
    --			buvvers_win_enter = true,
    --			-- set filetype
    --			buvvers_buf_opt = {
    --				filetype = "buvvers",
    --			},
    --			buffer_handle_list_to_buffer_name_list = function(handle_l)
    --				local name_l
    --
    --				local default_function = require("buvvers.buffer_handle_list_to_buffer_name_list")
    --				name_l = default_function(handle_l)
    --
    --				for n, name in ipairs(name_l) do
    --					local is_modified = vim.api.nvim_get_option_value("modified", { buf = handle_l[n] })
    --					local prefix
    --					if is_modified then
    --						prefix = "[+]"
    --					else
    --						prefix = "[ ]"
    --					end
    --					name_l[n] = {
    --						prefix,
    --						" ",
    --						name,
    --					}
    --				end
    --
    --				return name_l
    --			end,
    --		},
    --	},
    --	}}}
    install = { colorscheme = { "habamax" } },
}

-- }}}

-- vim:fdm=marker
