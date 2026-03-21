return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    keys = {
        {
            "s",
            "<Plug>(nvim-surround-normal)",
            desc = "Add surrounding (normal)",
        },
        {
            "ss",
            "<Plug>(nvim-surround-normal-cur)",
            desc = "Add surrounding (current line)",
        },
        {
            "S",
            "<Plug>(nvim-surround-normal-line)",
            desc = "Add surrounding (line)",
        },
        {
            "SS",
            "<Plug>(nvim-surround-normal-cur-line)",
            desc = "Add surrounding (whole line)",
        },
        {
            "s",
            "<Plug>(nvim-surround-visual)",
            mode = "x",
            desc = "Add surrounding (visual)",
        },
        {
            "S",
            "<Plug>(nvim-surround-visual-line)",
            mode = "x",
            desc = "Add surrounding (visual line)",
        },
    },
}
