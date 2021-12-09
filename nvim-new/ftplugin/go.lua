vim.cmd [[ autocmd BufWritePre <buffer> * <cmd>lua require'go.format'.goimport() ]]
require("go").setup()
