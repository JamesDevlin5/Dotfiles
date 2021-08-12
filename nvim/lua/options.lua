-- All vim-specific settings
-- https://rrethy.github.io/book/write_a_plugin_manager.html
local opt = vim.opt

-- TODO: Transfer `opt` calls to proper option scope call
local o = vim.o -- Global options
local wo = vim.wo -- Window options
local bo = vim.bo -- Buffer options

local cmd = vim.cmd
local u = require( "utils" )

-- u.makeAugroup('restoreSession', {{ 'BufReadPost', '*', 'if line("'\'") > 0 && line}})

do
  o.startofline = true

  o.cdpath = ",," .. vim.env.HOME

  o.ignorecase = true
  o.smartcase = true
  bo.infercase = true
  o.inccommand = "split"
  o.virtualedit = "block"

  o.equalalways = true
  o.scrolloff = 8
  o.sidescrolloff = 5
  wo.linebreak = true
  o.showbreak = "|"
  --[[
  o.fillchars = {
    vert = "⫼", -- ⸽⫿⫼ ⥙
    fold = "⩵", -- ⸗⬦ 
    foldopen = "◊", -- ▿ ▾
    foldclose = "﬌",
    foldsep = "⌇", -- ┠
    diff = "⍙",
    eob = "",
  }]]
  o.cmdheight = 3

  o.completeopt = "menuone,noinsert,noselect"

  --[[
  o.listchars = {
    eol = "⏎",
    tab = "<->",
    -- space = "⍛",
    trail = "⨟",
    extends = "~",
    precedes = "~",
  }]]

  wo.number = true
  wo.conceallevel = 1
  o.concealcursor = "nc"

  o.updatetime = 100

  o.termguicolors = true
  -- o.guicursor = ''
  wo.cursorline = true
  o.hidden = true
  o.switchbuf = "useopen,vsplit"
  o.splitbelow = true
  o.splitright = true

  o.mouse = "nvi"
  o.mousemodel = "popup_setpos"

  o.showmode = false

  -- TODO: Use Symbols
  --[[
  local mode_symbols = {
    n = "", -- Normal
    v = "", -- Visual
    -- `:h mode()`
  }
  
  -- TODO: Fix
  opt.verbosefile = '/tmp/messages.nvim.log'
  local undo_dir = os.getenv('HOME')..'/.local/share/nvim/undo'
  os.execute('mkdir -p '..undo_dir)
  ]]

  o.confirm = true
  o.undolevels = 9999
  bo.undofile = true
  o.timeoutlen = 400 -- milliseconds

  o.shortmess = "inotTI"
  vim.opt.cpoptions:append( "Z;_" )
  --vim.opt.formatoptions="qn1jp"
  --bo.formatoptions = ""

  bo.wrapmargin = 6

  o.pumheight = 16
  o.pumwidth = 22

  -- opt.showmatch = true
  o.joinspaces = false

  local indentSize = 2
  bo.tabstop = indentSize
  bo.shiftwidth = indentSize
  o.softtabstop = indentSize
  o.shiftround = true
  bo.expandtab = true

  o.foldlevelstart = 1
  wo.foldcolumn = "auto:2"
  vim.opt.foldopen:remove( { "hor" } )
  wo.foldnestmax = 10
  wo.foldmethod = "indent"

  wo.signcolumn = "yes:2"

  vim.opt.backupdir:remove( { "." } )
end

--[[
TODO: Set up ripgrep
if executable('rg')
    set grepformat=%f:%l:%c:%m
    let &grepprg = 'rg --vimgrep --trim --no-heading' . (&smartcase ? ' --smart-case' : '') . ' --'
endif
]]

