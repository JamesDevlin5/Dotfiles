-- lsp object
local nvim_lsp = require"lspconfig"

-- function to attach completion when setting up lsp
local on_attach = function( client )
  require"completion".on_attach( client )
end

-- rust analyzer
nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- Enable Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with( vim.lsp.diagnostic.on_public_diagnostics,
                { virtual_text = true, signs = true, update_in_insert = true } )

