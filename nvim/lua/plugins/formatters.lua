local formatters = {
    bash = { "shfmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    json = { "jq" },
    lua = { "stylua" },
    python = { "isort", "black" },
    sh = { "shfmt" },
    toml = { "taplo" },
    yaml = { "yamlfmt" },
}

---@module "lazy"
---@type LazySpec
return {
    "stevearc/conform.nvim",
    ft = vim.tbl_keys(formatters),
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true }, function(err, did_format)
                    if err then
                        vim.notify("Format error: " .. err, vim.log.levels.ERROR)
                    elseif did_format then
                        vim.notify("Formatted", vim.log.levels.INFO)
                    else
                        vim.notify("Nothing to format", vim.log.levels.WARN)
                    end
                end)
            end,
            mode = { "n", "v" },
            desc = "Format buffer",
        },
    },
    cmd = { "ConformInfo" },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    opts = {
        default_format_opts = {
            lsp_format = "fallback",
        },
        formatters_by_ft = formatters,
        format_on_save = false,
        notify_on_error = true,
    },
    formatters = {
        ["clang-format"] = {
            prepend_args = { "--sort-includes", "--style=file:~/.config/clang-format/clang-format" },
        },
    },
}
