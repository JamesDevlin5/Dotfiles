--[[ Compile this file after saving any changes
vim.cmd [[
augroup packer_auto_compile
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  autocmd BufDelete plugins.lua | PackerSync
augroup END
]]
--]]

--[[

use {
  'myusername/example',        -- The plugin location string
  -- The following keys are all optional
  disable = boolean,           -- Mark a plugin as inactive
  as = string,                 -- Specifies an alias under which to install the plugin
  installer = function,        -- Specifies custom installer. See "custom installers" below.
  updater = function,          -- Specifies custom updater. See "custom installers" below.
  after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
  rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
  opt = boolean,               -- Manually marks a plugin as optional.
  branch = string,             -- Specifies a git branch to use
  tag = string,                -- Specifies a git tag to use
  commit = string,             -- Specifies a git commit to use
  lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
  run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
  requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
  rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
  config = string or function, -- Specifies code to run after this plugin is loaded.
  -- The setup key implies opt = true
  setup = string or function,  -- Specifies code to run before this plugin is loaded.
  -- The following keys all imply lazy-loading and imply opt = true
  cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
  ft = string or list,         -- Specifies filetypes which load this plugin.
  keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
  event = string or list,      -- Specifies autocommand events which load this plugin.
  fn = string or list          -- Specifies functions which load this plugin.
  cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
  module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
                               -- with one of these module names, the plugin will be loaded.
  module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
  requiring a string which matches one of these patterns, the plugin will be loaded.
}


--]]

require("packer").startup {
  function()
    -- Manage Thyself
    use { "wbthomason/packer.nvim" }

    -- Tree Sitter
    use {
      "nvim-treesitter/nvim-treesitter",
      as = "treesitter",
      run = ":TSUpdate",
      requires = { "p00f/nvim-ts-rainbow" },
      config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = {
            "bash",
            "cpp",
            "comment",
            -- "dart",
            -- "dot",
            "html",
            -- "java",
            "json",
            "latex",
            "lua",
            "python",
            -- "regex",
            "rust",
            "toml",
            -- "verilog",
            "yaml",
          },
          highlight = {
            enable = true,
          },
          rainbow = {
            enable = true,
            extended_mode = true,
          },
        }
        -- vim.opt.foldmethod = "expr"
        -- FIXME: vim.opt.foldexpr = vim.cmd [[nvim_treesitter#foldexpr]]
      end,
    }

    -- Icons
    use {
      'yamatsum/nvim-nonicons',
      -- if use nvim-web-devicons
      requires = {'kyazdani42/nvim-web-devicons'}
    }

    --[[
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          mode = "lsp_document_diagnostics",
          fold_open = "",
          fold_closed = "",
          action_keys = {
            open_split = { "<C-h>" },
          },
          use_lsp_diagnostic_signs = true,
        }
      end,
    }
    --]]

    -- Tree Explorer
    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-tree").setup {
          auto_close = true,
          open_on_tab = false,
          hijack_cursor = true,
          update_cwd = true,
          diagnostics = { enable = true },
          update_focused_file = {
            enable = true,
            update_cwd = true,
          },
          view = {
            width = "30%",
          },
        }
      end,
    }

    -- Terminal
    use {
      "numToStr/FTerm.nvim",
      config = function()
        require("FTerm").setup {
          border = "rounded",
          blend = 10,
          dimensions = {
            height = 0.7,
            width = 0.8,
          },
        }
      end,
    }

    -- Looks Nice
    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {
          dimming = { inactive = true },
        }
      end,
      cmd = { "Twilight", "TwilightEnable" },
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("indent_blankline").setup {
          char_list = { "|", "¦", "┆", "┊" },
          show_current_context = true,
          show_current_context_start = true,
          use_treesitter = true,
          indent_increase = 1,
          show_first_indent_level = false,
          show_trailing_blankline_indent = false,
          show_end_of_line = true,
          filetype_exclude = {
            "gitcommit",
            "help",
            "markdown",
            "bash",
            "shell",
            "FTerm",
          },
          buftype_exclude = { "terminal" },
          -- context_char_list = { "┃", "║", "|" },
          context_char = ":",
        }
      end,
    }

    -- Keybinds
    use { "LionC/nest.nvim" }

    -- Symbol Renamer
    use {
      'filipdutescu/renamer.nvim',
      branch = 'master',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = function()
        require"renamer".setup {
          padding = {
            top = 1,
            bottom = 1,
            left = 0,
            right = 0,
          },
          mappings = {
            ['<C-c>'] = function() vim.api.nvim_input('<Esc>') end,
          }
        }
      end,
    }

    use {
      "luukvbaal/stabilize.nvim",
      config = function()
        require("stabilize").setup {
          nested = "QuickFixCmdPost,User LspDiagnosticsChanged",
        }
      end,
    }

    use {
      "windwp/nvim-autopairs",
      config = function()
        local ap = require "nvim-autopairs"
        ap.setup {
          ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
          disable_in_macro = true,
          disable_in_visualblock = true,
          -- map_c_w = true,
          -- map_cr = true,
          check_ts = true, -- Treesitter
          ts_config = {
            lua = { "string" },
            python = { "comment" },
          },
          --[[
          fast_wrap = {
            map = "<M-e>",
            chars = { "{", "[", "(", '"', "'" },
          },--]]
        }
        ap.add_rules(require "nvim-autopairs.rules.endwise-lua")
      end,
    }

    -- Colorschemes
    use { "Th3Whit3Wolf/one-nvim" }
    use { "folke/tokyonight.nvim" }
    use { "doums/darcula" }

    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup(nil, {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = true, -- "Name" codes like Blue
          RRGGBBAA = false, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = false, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes: foreground, background
          mode = "background", -- Set the display mode.
        })
      end,
    }

    use {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      tag = "release",
      config = function()
        require("gitsigns").setup {
          watch_gitdir = { interval = 6000000 },
          -- numhl = true,
        }
      end,
    }

    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup { ignore = "^$" }
      end,
    }

    use { "rcarriga/nvim-notify" }
    use {
      "hood/popui.nvim",
      requires = "https://github.com/RishabhRD/popfix",
      config = function()
        vim.g.popui_border_style = "rounded"
        vim.ui.select = require "popui.ui-overrider"
      end,
    }

    use {
      "neovim/nvim-lspconfig",
      requires = { { "williamboman/nvim-lsp-installer", opt = true }, { "glepnir/lspsaga.nvim" } },
      config = function()
        require("lspsaga").init_lsp_saga {
          use_saga_diagnostic_sign = true,
          -- error_sign = '',
          -- warn_sign = '',
          -- hint_sign = '',
          -- infor_sign = '',
          dianostic_header_icon = "[ ]",
          code_action_icon = "",
          code_action_prompt = {
            enable = false,
            sign = false,
            sign_priority = 20,
            virtual_text = false,
          },
          finder_definition_icon = " ",
          finder_reference_icon = " ",
          max_preview_lines = 12, -- preview lines of lsp_finder and definition preview
          finder_action_keys = {
            open = "o",
            vsplit = "v",
            split = "s",
            quit = { "q", "<Esc>", "<C-c>" },
            scroll_down = "<C-j>",
            scroll_up = "<C-k>",
          },
          code_action_keys = {
            quit = "q",
            exec = "<CR>",
          },
          rename_action_keys = {
            quit = { "<C-c>", "<Esc>" },
            exec = "<CR>",
          },
          definition_preview_icon = " ",
          -- "single" "double" "round" "plus"
          border_style = "round",
          rename_prompt_prefix = "➤ ",
          -- if you don't use nvim-lspconfig you must pass your server name and
          -- the related filetypes into this table
          -- like server_filetype_map = {metals = {'sbt', 'scala'}}
          -- server_filetype_map = {}
        }
      end,
    }

    use {
      "hrsh7th/nvim-cmp",
      requires = {
        { "L3MON4D3/LuaSnip" },
        { "kdheepak/cmp-latex-symbols" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "onsails/lspkind-nvim" },
        { "ray-x/cmp-treesitter" },
      },
      config = function()
        require "nvim_cmp_cfg"
      end,
    }

    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("lualine").setup {
          options = {
            theme = "tokyonight",
            -- theme = "codedark",
            --theme = "evil_lualine",
            -- component_separators = { left = '>', right = '<', },
            -- section_separators = { left = '}', right = '{', },
            section_separators = { left = "", right = "" },
            component_separators = { left = "", right = "" },
            disabled_filetypes = { "qf", "packer", "NvimTree" },
            always_divide_middle = true,
          },
          extensions = { "fzf", "nvim-tree", "quickfix", "symbols-outline" },
          sections = {
            lualine_a = { { "mode", padding = { left = 2, right = 1 } } },
            lualine_b = { "b:gitsigns_head", "b:gitsigns_status" },
            lualine_c = {
              {
                "filename",
                file_status = true,
                path = 0,
                shorting_target = 30,
              },
            },
            lualine_x = { { "filetype", { colored = true } } },
            lualine_y = {
              {
                "diagnostics",
                -- table of diagnostic sources, available sources:
                -- 'nvim_lsp', 'nvim', 'coc', 'ale', 'vim_lsp'
                -- Or a function that returns a table like
                --   {error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt}
                sources = { "nvim_diagnostic", "nvim_diagnostic" },
                -- displays diagnostics from defined severity
                sections = { "error", "warn", "info", "hint" },
                diagnostics_color = {
                  -- Same values like general color option can be used here.
                  error = "DiagnosticError", -- changes diagnostic's error color
                  warn = "DiagnosticWarn", -- changes diagnostic's warn color
                  info = "DiagnosticInfo", -- Changes diagnostic's info color
                  hint = "DiagnosticHint", -- Changes diagnostic's hint color
                },
                symbols = { error = "E", warn = "W", info = "I", hint = "H" },
                colored = true, -- displays diagnostics status in color if set to true
                update_in_insert = false, -- Update diagnostics in insert mode
                always_visible = false, -- Show diagnostics even if count is 0, boolean or function returning boolean
              },
            },
            lualine_z = { "require'scrollbar'.run()", "location" },
          },
        }
      end,
    }

    use {
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("bufferline").setup {}
      end,
    }

    --[[
    use {
      "kevinhwang91/nvim-bqf",
      ft = "qf",
      config = function()
        require("bqf").setup {}
      end,
    }

    -- use { "simrat39/symbols-outline.nvim" }


    use {
      "onsails/diaglist.nvim",
      config = function()
        require("diaglist").init {
          -- optional settings
          -- increase for noisy servers
          debounce_ms = 500,

          -- list in quickfix only diagnostics from clients
          -- attached to a current buffer
          -- if false, all buffers' clients diagnostics is collected
          buf_clients_only = true,
        }
      end,
    }
    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    }

    -- Marks
    use { "chentau/marks.nvim" }

    -- Registers
    use { "tversteeg/registers.nvim" }

    --]]

    use {
      "blackCauldron7/surround.nvim",
      config = function()
        require("surround").setup {
          mappings_style = "sandwich",
        }
      end,
    }

    -- use { "ray-x/go.nvim", ft = "go" }
    use { "SidOfc/mkdx", ft = "markdown" }
    use { "rafcamlet/nvim-luapad", ft = "lua" }
    -- use { "aklt/plantuml-syntax", ft = "pu" }
  end,
}
