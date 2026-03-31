return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local function transparent_theme(base)
            local custom_theme = require("lualine.themes." .. base)

            local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal"})
            custom_theme.normal.c.bg = string.format("#%06x", normal_hl.bg)

            if base:find("ayu") then
                custom_theme.normal.b.bg = "#2a404d"
                custom_theme.insert.b.bg = "#2a404d"
                custom_theme.visual.b.bg = "#2a404d"
                custom_theme.replace.b.bg = "#2a404d"
                -- custom_theme.command.b.bg = "#2a404d"
                custom_theme.inactive.b.bg = "#2a404d"
            end

            return custom_theme
        end

        require("lualine").setup {
            options = {
                icons_enabled = true,
                -- Theme List: https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md
                theme = transparent_theme("ayu_mirage"),
                -- theme = transparent_theme("onedark"),
                -- theme = transparent_theme("horizon"),
                padding = 2,
                globalstatus = true,
                -- component_separators = { '', '' },
                -- section_separators = { '', '' },
                disabled_filetypes = { "help", "dashboard", "telescope", "scratch" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    "branch",
                    "diff",
                    "diagnostics",
                    "filename",
                    function()
                        return require("lsp-progress").progress()
                    end,
                },
                lualine_c = {},
                -- lualine_c = {
                --     "filename",
                --     function()
                --         return require("lsp-progress").progress()
                --     end,
                -- },
                lualine_x = {},
                lualine_y = {
                    {
                        "searchcount",
                        maxcount = 999,
                        timeout = 500,
                    },
                    {
                        function()
                            local starts = vim.fn.line("v")
                            local ends = vim.fn.line(".")
                            local count = starts <= ends and ends - starts + 1 or starts - ends + 1
                            return count .. " Lines Selected"
                        end,
                        cond = function()
                            return vim.fn.mode():find("[Vv]") ~= nil
                        end,
                    },
                    "filetype",
                },
                lualine_z = { "location", "progress" },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_c = {}, -- disable filename from here
                lualine_x = {}, -- disable location
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
            extensions = {
                "lazy",
                "man",
                "mason",
                "quickfix",
            }
        }
    end,
}
