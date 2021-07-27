
return require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    lower = false,
    padding = 3,
    -- component_separators = { '⁘ ›', '‹⁘ ' },
    -- section_separators = { '┅⧐  ', ' ⧏ ┅' },
    section_separators = { '', '' },
    component_separators = { '', ''},
    disabled_filetypes = { 'help', 'dashboard', 'telescope', 'scratch' }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {{
      'filename',
      -- ReadOnly/Modified/...
      file_status = true,
      -- 0: just filename, 1: relative path, 2: absolute path
      path = 1,
      color = { fg = 'cyan' },
    }},
    lualine_c = {{
      'filetype',
      colored = true,
      --color = {fg = '#dbdbdb', bg = '#8a8881'},
    }},

    lualine_x = {{
      'diff',
      colored = true,
      -- Color Format = #rrggbb
      color_added = '#16a64d',
      color_modified = '#b8b828',
      color_removed = '#b0122f',
      symbols = {
        added = "⊞ ",
        -- added = "🆕 "
        modified = "≋ ",
        removed = "Ⓧ ",
        -- removed = "☒ "
      }
    }},
    lualine_y = {'progress', 'encoding', 'fileformat'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{ 'filename', file_status = true, path = 1 }},

    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}

--  
--    

