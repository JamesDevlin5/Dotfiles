return {
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
}
