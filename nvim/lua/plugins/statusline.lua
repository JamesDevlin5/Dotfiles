-- Setup the status line
require( "lualine" ).setup{
  options = {
    icons_enabled = true,
    -- Theme List: https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md
    theme = "horizon",
    padding = 2,
    -- component_separators = { '', '' },
    -- section_separators = { '', '' },
    disabled_filetypes = { "help", "dashboard", "telescope", "scratch" },
  },
}

