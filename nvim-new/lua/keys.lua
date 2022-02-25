return require("nest").applyKeymaps {
  {
    "<Leader>",
    {
      { "b", ":BufferLinePick<CR>" },
      { "B", ":BufferLinePickClose<CR>" },
      { "G", require("gitsigns").setqflist },
      --[[
      { "qq", ":LLToggle!<CR>" },
      { "qo", ":LLOpen<CR>" },
      { "oq", ":copen<CR>" },
      { "ol", ":lopen<CR>" },
      --]]
      { "c", ":close<CR>" },
      { "x", ":bwipeout<CR>" },
      { "t", require("nvim-tree").toggle },
      { "r", require("renamer").rename },
      {
        mode = "nv",
        {
          { "w", ":write!<CR>" },
          { "n", require("notify").dismiss },
          { "s",
            {
              { "h", ":split<CR>" },
              { "v", ":vsplit<CR>" }
            },
          },
        },
      },
    },
  },
  {
    "<M-",
    {
      { "t>", require("FTerm").toggle, mode = "nvit" },
      { "c>", require"FTerm".close, mode = "t"},
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
          { "r>", require("renamer").rename },
        },
      },
    },
  },
  { "j", "gj" },
  { "k", "gk" },
  -- Center view on each search jump
  { "n", "nzzzv" },
  { "N", "Nzzzv" },
  { "<C-", {{"f>", "<C-f>zz"}, {"d>", "<C-d>zz"}, {"u>", "<C-u>zz"}, {"b>", "<C-b>zz"}}},
  { mode = "nv", {{"H", "^"}, {"L", "$"}, {"<Space>", "<Nop>"}}},
  { "Y", "y$" },
  { "<Tab>", "<C-w>w" },
  { "<S-Tab>", "<C-w>W" },
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
