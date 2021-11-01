
o = vim.o

o.number = true
o.startofline = true
-- TODO: o.cdpath:append(os.env("HOME")) --?
o.ignorecase = true
o.smartcase = true
o.background = 'dark'

o.scrolloff = 8
o.linebreak = true
o.breakindent = true
o.showbreak = ' :> '
o.sidescrolloff = 3
o.cmdheight = 3
o.redrawtime = 600 -- milliseconds
o.termguicolors = true
o.splitright = true
o.mouse = 'nvi'
o.confirm = true
o.infercase = true
o.showmatch = true
-- TODO: o.matchpairs:append({
o.joinspaces = false
o.foldlevelstart = 2
o.foldcolumn = 'auto:3'
--o.foldopen:remove('hor')
o.foldmethod = 'indent'
o.ttimeoutlen = 300
o.wildignorecase = true

--tab_spaces = 4
--o.tabstop = tab_spaces
--o.shiftwidth = tab_spaces
--o.softtabstop = tab_spaces
--o.shiftround = true
--o.expandtab = true
--o.smartindent = true

--o.verbosefile = '~/.local/share/nvim/verbose.log'
o.undodir = '~/.local/share/nvim/undo'
o.backupdir = '~/.local/share/nvim/backup'

