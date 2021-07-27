--[[ Tree sitter folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
]] return require( "nvim-treesitter.configs" ).setup{
  ensure_installed = {
    "bash", "comment", "javascript", "json", "jsonc", "lua", "python", "regex",
    "rust", "toml", "yaml", "java", "html",
  },
  highlight = {
    disable = { "markdown", "help" },
    custom_captures = {},
    enable = false,
  },
  incremental_selection = {
    disable = {},
    init_selection = "gnn",
    node_incremental = "grn",
    scope_incremental = "grc",
    node_decremental = "grm",
    enable = true,
  },
  indent = {
	  enable = true,
  },
}

