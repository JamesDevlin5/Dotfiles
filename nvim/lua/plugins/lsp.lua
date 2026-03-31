-- Toggle LSP log level between "error" and "trace"
local lsp_diag_silenced = false

local function toggle_lsp_level()
    if lsp_diag_silenced then
        vim.diagnostic.config {
            signs = true,
            underline = true,
            virtual_lines = true,
        }
        vim.notify("LSP diagnostics: ALL", vim.log.levels.INFO)
    else
        vim.diagnostic.config {
            signs = { severity = { min = vim.diagnostic.severity.ERROR } },
            underline = { severity = { min = vim.diagnostic.severity.ERROR } },
            virtual_lines = { severity = { min = vim.diagnostic.severity.ERROR } },
        }
        vim.notify("LSP diagnostics: ERROR only", vim.log.levels.WARN)
    end
    lsp_diag_silenced = not lsp_diag_silenced
end

-- Keybinding
vim.keymap.set("n", "<leader>ll", toggle_lsp_level, { desc = "Toggle LSP log level" })

-- User command
vim.api.nvim_create_user_command(
    "LspToggleLog",
    toggle_lsp_level,
    { desc = "Toggle LSP log level" }
)

---@module "lazy"
---@type LazySpec
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        { "williamboman/mason-lspconfig.nvim", opts = {} },
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
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
            "taplo",
            "rust_analyzer",
            "ts_ls",
            -- "commitlint"
        }

        local tools = {
            "yamlfmt",
            "shfmt",
            "commitlint",
            "taplo",
        }

        -- Setup Mason first
        require("mason").setup()

        -- Then setup mason-lspconfig
        require("mason-lspconfig").setup {
            ensure_installed = language_servers, -- auto-install these
            automatic_enable = true,
        }

        require("mason-tool-installer").setup {
            ensure_installed = tools,
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
