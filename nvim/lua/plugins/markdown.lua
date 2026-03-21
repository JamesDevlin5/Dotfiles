return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        completions = { list = { enabled = true } },
    },
    keys = {
        {
            "<Leader>r",
            function()
                require("render-markdown").toggle()
            end,
            desc = "Toggle markdown rendering",
        },
    },
    ft = { "markdown" },
}
