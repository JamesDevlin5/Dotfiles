---@module "lazy"
---@type LazySpec
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        { "williamboman/mason-lspconfig.nvim", opts = {} },
        { "saghen/blink.cmp" },
    },
    config = function()
        local language_servers = {
            "bashls",
            "clangd",
            "jsonls",
            "lua_ls",
            "marksman",
            "pyright",
            "rust_analyzer",
            "ts_ls",
            -- "commitlint"
        }

        -- Setup Mason first
        require("mason").setup()

        -- Then setup mason-lspconfig
        require("mason-lspconfig").setup {
            ensure_installed = language_servers, -- auto-install these
            automatic_enable = true,
        }

        -- Finally setup your language servers
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        for _, language_server in ipairs(language_servers) do
            vim.lsp.config(language_server, { capabilities = capabilities })
        end

        vim.lsp.config("clangd", {
            cmd = { "clangd", "--query-driver=/usr/bin/g++,/usr/bin/gcc,/usr/bin/clang++" },
        })

        vim.lsp.config("pyright", {
            settings = {
                python = {
                    pythonPath = ".venv/bin/python",
                },
            },
        })
    end,
}
