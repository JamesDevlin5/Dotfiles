---@module "lazy"
---@type LazySpec
return {
    "numToStr/FTerm.nvim",
    opts = {},
    keys = {
        {
            "<C-`>",
            function()
                require("FTerm").toggle()
            end,
            mode = { "n", "t" },
            desc = "Toggle the terminal",
        },
        -- Example: binding a terminal command
        -- {
        --     "<Leader>r",
        --     function()
        --         require("FTerm").run("compile.bash")
        --     end,
        --     desc = "Runs the compile.bash script in a terminal"
        -- }
    },
}
