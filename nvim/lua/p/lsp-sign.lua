
return require('lsp_signature').on_attach({
  bind = true,
  doc_lines = 3,
  floating_window = true,
  fix_pos = true, -- Don't close until all parameters have been completed (true)
  hint_enable = true,
  hint_prefix = "! ",
  hint_scheme = "String",
  hi_parameter = "Search",
  max_height = 16,
  max_width = 100,
  handler_opts = {
    border = "shadow"
  },
})

