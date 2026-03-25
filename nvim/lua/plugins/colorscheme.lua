---@diagnostic disable: unused-function
---@diagnostic disable: unused-local

local function onedark()
    return {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = 'cool', -- dark/cool/warm
            code_style = {
                comments = 'none',
            },
            lualine = {
                transparent = true,
            }
        },
        config = function(_, opts)
            require("onedark").setup(opts)
            require("onedark").load()
        end,
        enabled = not require("utils").is_vscode(),
    }
end

local function lvim()
    return {
        "lvim-tech/lvim-colorscheme",
        dependencies = { "lvim-tech/lvim-utils" },
        lazy = false,
        priority = 1000,
        config = function()
            require("lvim-colorscheme").setup {
                styles = {
                    comments = { italic = false, bold = false },
                    keywords = { italic = false, bold = true },
                    functions = { italic = false, bold = false },
                    variables = {},
                },
            }
            vim.cmd.colorscheme("lvim-kanagawa-soft")
        end,
        enabled = not require("utils").is_vscode(),
    }
end

local function astronvim()
    return {
        "AstroNvim/astrotheme",
        lazy = false,
        priority = 1000,
        config = function()
            require("astrotheme").setup {
                style = {
                    italic_comments = false,
                },
                plugins = {
                    ["blink-cmp"] = true,
                    ["gitsigns"] = true,
                    ["lazy"] = true,
                    ["lualine"] = true,
                    ["mason"] = true,
                    ["mini"] = true,
                    ["nvim-notify"] = true,
                    ["rainbow-delimiters"] = true,
                    ["todo-comments"] = true,
                },
                palette = "astrodark",
                palettes = {
                    astrodark = {
                        ui = {
                            base = "#252630",
                            inactive_base = "#252630",
                        },
                    },
                },
                highlights = {
                    astrodark = {
                        modify_hl_groups = function(hl, c)
                            -- hl.LineNr = { bg = "#1a1b2e", fg = c.ui.text_inactive }
                            -- hl.CursorLineNr = { bg = "#1a1b2e", fg = c.ui.text }
                        end,
                    },
                },
            }
            vim.cmd.colorscheme("astrodark")
        end,
    }
end

return onedark()
-- return lvim()
-- return astronvim()
