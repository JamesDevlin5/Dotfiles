return require('nvim-treesitter.configs').setup {
  rainbow = {
    disable = {},
    extended_mode = true, -- Highlight all delimeters (not just parens)
    max_file_lines = 1200,
    colors = {
      "#cc241d",
      "#a89984",
      "#b16286",
      "#d79921",
      "#689d6a",
      "#d65d0e",
      "#458588"
    },
    termcolors = {
      'Blue',
      'Magenta',
      'Red',
      'Green',
      'Yellow',
      'White',
      'Cyan',
    },
    enable = true,
  }
}

