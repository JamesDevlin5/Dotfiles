---@module "lazy"
---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "bash",
            "comment",
            "c",
            "cpp",
            "diff",
            "git_config",
            "git_rebase",
            "gitcommit",
            "gitignore",
            "javascript",
            "json",
            "lua",
            "luadoc",
            "make",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "rust",
            "toml",
            "vim",
            "vimdoc",
        },
        auto_install = false,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
        folds = { enable = true },
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["aa"] = "@parameter.outer",  -- great for swapping args
                    ["ia"] = "@parameter.inner",
                    ["ab"] = "@block.outer",
                },
            },
            move = {
                enable = true,
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                },
            },
            swap = {
                enable = true,
                swap_next = { ["<leader>a"] = "@parameter.inner" },
                swap_previous = { ["<leader>A"] = "@parameter.inner" },
            },
        },
    },
    --[[
    config = function(_, opts)
        local TS = require("nvim-treesitter")
        TS.setup(opts)

        --[[
        -- highlighting
        if enabled("highlight", "highlights") then
          pcall(vim.treesitter.start, ev.buf)
        end

        -- indents
        if enabled("indent", "indents") then
          LazyVim.set_default("indentexpr", "v:lua.LazyVim.treesitter.indentexpr()")
        end

        -- folds
        if enabled("folds", "folds") then
          if LazyVim.set_default("foldmethod", "expr") then
            LazyVim.set_default("foldexpr", "v:lua.LazyVim.treesitter.foldexpr()")
          end
        end
    end
    --]]
}
