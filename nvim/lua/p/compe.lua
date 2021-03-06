
require('compe').setup({
  enabled = true;
  autocomplete = true;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 300;
  resolve_timeout = 1000;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    -- [ "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" ]
    border = { '╭', '┄' ,'╮', '│', '╯', '═', '╰', '│' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 50,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 4,
  };

  source = {
    path = true;
    buffer = true;
    calc = false;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
})

