--[[  Status Line Config  ]]

require"lualine".setup {
  options = {
    icons_enabled = true,
    padding = 1,
    theme = "onedark",
    section_separators = { "▶", "◀" },
    component_separators = { "⁝", "⁝" },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { { "mode", upper = true } },
    lualine_b = { "FugitiveHead" },
    lualine_c = { { "filename", file_status = true } },
    lualine_x = { { "encoding", lower = true }, "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

