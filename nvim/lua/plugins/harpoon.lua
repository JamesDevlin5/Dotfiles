---@module "lazy"
---@type LazySpec
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        --[[ Telescope Usage:
        local harpoon = require('harpoon')
        harpoon:setup({})

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })
        ---]]
    end,
    keys = {
        {
            "<Leader>a",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Add to harpoon list",
        },
        {
            "<C-e>",
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end,
            desc = "Show harpoon list",
        },
        {
            "<C-h>",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "GoTo ... harpoon tag",
        },
        {
            "<C-t>",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "GoTo ... harpoon tag",
        },
        {
            "<C-n>",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "GoTo ... harpoon tag",
        },
        {
            "<C-s>",
            function()
                require("harpoon"):list():select(4)
            end,
            desc = "GoTo ... harpoon tag",
        },
        -- Toggle previous & next buffers stored within Harpoon list
        {
            "<C-S-P>",
            function()
                require("harpoon"):list():prev()
            end,
            desc = "GoTo previous harpoon tag",
        },
        {
            "<C-S-N>",
            function()
                require("harpoon"):list():next()
            end,
            desc = "GoTo next harpoon tag",
        },
    },
}
