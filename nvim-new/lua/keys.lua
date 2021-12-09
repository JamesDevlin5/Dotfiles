return require("nest").applyKeymaps {
  {
    "<Leader>",
    {
      -- Telescope Finder
      {
        "f",
        {
          { "m", require("telescope.builtin").marks },
          { "c", require("telescope.builtin").commands },
          { "f", require("telescope.builtin").find_files },
          { "l", require("telescope.builtin").live_grep },
          { "b", require("telescope.builtin").buffers },
          { "h", require("telescope.builtin").help_tags },
          { "s", require("telescope").extensions.luasnip.luasnip },
          {
            "g",
            {
              { "f", require("telescope.builtin").git_files },
              { "b", require("telescope.builtin").git_branches },
              { "c", require("telescope.builtin").git_commits },
              { "s", require("telescope.builtin").git_status },
            },
          },
        },
      },
      {
        "<C-",
        {
          { "s>", require("telescope.builtin").grep_string },
          { "r>", require("telescope.builtin").command_history },
          { "b>", require("telescope.builtin").buffers },
          { "g>", require("telescope.builtin").git_files },
        },
      },
      {
        "q",
        {
          { "f", require("telescope.builtin").quickfix },
          { "g", require("gitsigns").setqflist },
        },
      },
      { "b", ":BufferLinePick<CR>" },
      { "B", ":BufferLinePickClose<CR>" },
      --[[
      {
        "c",
        {
          { "a", require("lspsaga.codeaction").code_action, mode = "n" },
          { "a", require("lspsaga.codeaction").range_code_action, mode = "v" },
          { "d", require("lspsaga.diagnostic").show_line_diagnostics },
          { "c", require("lspsaga.diagnostic").show_cursor_diagnostics },
        },
      },
      { "qq", ":LLToggle!<CR>" },
      { "qo", ":LLOpen<CR>" },
      { "oq", ":copen<CR>" },
      { "ol", ":lopen<CR>" },
      --]]
      { "c", ":close<CR>" },
      { "x", ":bwipeout<CR>" },
      { "w", ":write!<CR>" },
      { "t", require("nvim-tree").toggle },
      { "e", require("telescope.builtin").file_browser },
      { "S", require("spectre").open },
      {
        "s",
        {
          { "s", require("spectre").open },
          {
            "w",
            function()
              require("spectre").open_visual { select_word = true }
            end,
          },
          { "v", require("spectre").open_visual },
        },
      },
      { "v", "<C-w>v" },
      { "h", "<C-w>s" },
      { "N", require("notify").dismiss },
    },
  },
  {
    "<M-",
    {
      { "t>", require("FTerm").toggle },
      -- Older pos in jump list
      { "Left>", "<C-o>" },
      -- Newer pos in jump list
      { "Right>", "<C-i>" },
      -- Older pos in change list
      { "Down>", "g;" },
      -- Newer pos in change list
      { "Up>", "g," },
    },
  },
  {
    mode = "t",
    {
      { "<M-t>", require("FTerm").toggle },
      { "<Esc>", require("FTerm").close },
      { "<M-c>", require("FTerm").close },
      -- <C-@> === Ctrl+Space
      -- For (vim)grep
      { "<C-@>", ".*" },
    },
  },
  {
    mode = "i",
    {
      -- Exit Insert Mode
      { "jf", "<Esc>" },
      { "jk", "<Esc>" },
      {
        "<C-",
        {
          { "h>", "<Left>" },
          { "j>", "<Down>" },
          { "k>", "<Left>" },
          { "l>", "<Right>" },
        },
      },
    },
  },
  {
    mode = "v",
    {
      { "<Leader>s", require("spectre").open_file_search },
    },
  },
  { "j", "gj" },
  { "k", "gk" },
  -- Center view on each search jump
  { "n", "nzzzv"},
  { "N", "Nzzzv"},
  -- { "K", require("lspsaga.hover").render_hover_doc },
  -- { "gr", require("lspsaga.rename").rename },
  -- { "gd", require("lspsaga.provider").preview_definition },
  { "H", "^", mode = "nv" },
  { "L", "$", mode = "nv" },
  { "Y", "y$", mode = "nv" },
  { "<Space>", "<Nop>", mode = "nv" },
  { "<Tab>", "<C-w>w" },
  { "<S-Tab>", "<C-w>W" },
  --[[
  {
    "<C-",
    {
      {
        "f>",
        function()
          require("lspsaga.action").smart_scroll_with_saga(1)
        end,
      },
      {
        "b>",
        function()
          require("lspsaga.action").smart_scroll_with_saga(-1)
        end,
      },
      { "s>", require("lspsaga.signaturehelp").signature_help },
    },
  },
  --]]
  -- Redo
  { "U", "<C-r>" },
  -- Paste, Then Fix Indentation
  { "p", "p`[V`]=`>" },
  { "P", "P`[V`]=`>" },
  {
    "<LocalLeader>",
    {
      { "p", "p" },
      { "P", "P" },
    },
  },
  -- Jump Around
  -- { "<LeftMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.hover{ border = 'single' }<CR>" },
  -- { "<RightMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.definition()<CR>" },
  { "<C-ScrollWheelUp>", "<C-i>" },
  { "<C-ScrollWheelDown>", "<C-o>" },
  {
    "]",
    {
      { "b", ":BufferLineCycleNext<CR>" },
      { "q", ":cnext<CR>zz" },
      { "l", ":lnext<CR>zz" },
      { "t", ":tabnext<CR>" },
      -- { "j", "" }, -- jumplist next
      -- { "c", "" }, -- changelist next
      -- { "e", require("lspsaga.diagnostic").lsp_jump_diagnostic_next },
    },
  },
  {
    "[",
    {
      { "b", ":BufferLineCyclePrev<CR>" },
      { "q", ":cprev<CR>zz" },
      { "l", ":lprev<CR>zz" },
      { "t", ":tabprev<CR>" },
      -- { "j", "" }, -- jumplist prev
      -- { "c", "" }, -- changelist prev
      -- { "e", require("lspsaga.diagnostic").lsp_jump_diagnostic_prev },
    },
  },
}
