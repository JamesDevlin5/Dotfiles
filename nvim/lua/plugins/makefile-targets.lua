local use_local = false

if use_local then
    return {
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
        cmd = {
            "MakefileTargets",
            "MakefileTargetsRunLast",
        },
    }
else
    ---Gets the number of processors on the machine
    ---@return integer nprocs
    local function get_num_processors()
        local handle = assert(io.popen("nproc"), "Failed to open `nproc` process")
        local nproc = assert(handle:read("*n"), "Failed to get processor count") -- read a number directly
        handle:close()

        return nproc
    end

    ---@module "lazy"
    ---@type LazySpec
    return {
        "JamesDevlin5/makefile-targets.nvim",
        dependencies = { "nvim-mini/mini.nvim" },
        ---@module "makefile-targets"
        ---@type MakefileTargetsOpts
        opts = {
            make_args = "-j" .. get_num_processors(),
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
                "<Leader>mm",
                function()
                    require("makefile-targets.mini").pick_target()
                end,
                desc = "Make: pick target (Mini.pick)",
            },
        },
        cmd = {
            "MakefileTargets",
            "MakefileTargetsRunLast",
        },
    }
end
