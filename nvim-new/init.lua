opt = vim.opt

-- Options {{{

opt.termguicolors = true

-- Visual Guides
opt.number = true
opt.cursorline = true
opt.hlsearch = false
opt.startofline = true

opt.showmatch = true
opt.matchtime = 7

-- Menu
opt.cmdheight = 1
opt.laststatus = 2
opt.showmode = false
opt.showcmd = true
opt.wildmenu = true
opt.wildmode = { "list", "full" }
opt.shortmess = "inwaxoI"

-- Tabs
tab_spaces = 2
opt.tabstop = tab_spaces
opt.shiftwidth = tab_spaces
opt.softtabstop = tab_spaces
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Padding
opt.scrolloff = 10
opt.sidescrolloff = 6
opt.textwidth = 89
-- Breaks
opt.linebreak = true
opt.breakindent = true
opt.showbreak = " ﬌ "

--opt.splitbelow = true
opt.splitright = true
opt.switchbuf = "useopen,uselast"

opt.virtualedit = "block"
opt.backspace = { "indent", "eol", "start" }

-- Case
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.wildignorecase = true

-- Folding
opt.foldlevelstart = 2
opt.foldcolumn = "auto:3"
opt.foldmethod = "indent"
opt.foldopen:remove "hor"

-- Mouse
opt.mouse = "nvi"
opt.mousefocus = true
opt.mousemodel = "popup_setpos"

-- Conceal
opt.concealcursor = "nv"
opt.conceallevel = 1
-- Unknown Characters
opt.display = { "lastline", "uhex" }

-- Defaults
opt.hidden = true
opt.confirm = true
opt.autoread = true
opt.belloff = "all"
opt.joinspaces = false
opt.cdpath:append(os.getenv "HOME")
opt.modelines = 4
opt.formatoptions = "rqn1jp"
opt.completeopt = { "menu", "menuone", "noinsert" }
opt.inccommand = "split"

-- Undo
opt.undofile = true
opt.undolevels = 9999
-- opt.undodir = os.getenv "HOME" .. "/.local/share/nvim/undo"
opt.undodir = os.getenv "XDG_DATA_HOME" .. "/nvim/undo"
opt.backupdir:remove { "." }
opt.backupcopy = "no"
opt.writebackup = false
--opt.verbosefile = '~/.local/share/nvim/verbose.log'
opt.directory:remove { "." }

-- Loading
opt.redrawtime = 600
opt.ttimeoutlen = 800
opt.updatetime = 1000
opt.complete:remove { "i", "t" }

-- View
opt.diffopt = { "filler", "context:3", "vertical" }
opt.listchars = { tab = " ▸", eol = "¬", trail = "·", nbsp = "" }
opt.fillchars = { vert = "|", fold = "." }
opt.signcolumn = "auto:2"
opt.winblend = 10

-- Disable a bunch of (old) built-in plugins from loading {{{
for plugin in ipairs {
  "2html_plugin",
  "getscriptPlugin",
  "zip",
  "gzip",
  "logipat",
  "rrhelper",
  "tarPlugin",
  "vimballPlugin",
  "zipPlugin",
  "remote_plugins",
  "shada_plugin",
  "tutor_mode_plugin",
  "netrw",
  "netrwPlugin",
} do
  vim.g["loaded_" .. plugin] = true
end
vim.g.netrw_dirhistmax = 0

-- }}}

--}}}

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Other Sources {{{

require "plugins"

vim.notify = require "notify"
require "mkdirs"
require "keys"

--}}}

vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "NvimTree", "terminal", "packer" }
vim.cmd [[colo one-nvim]]

vim.cmd [[
augroup highlight_yanked
  autocmd!
  autocmd TextYankPost * lua require'vim.highlight'.on_yank{timeout = 800, on_visual = false }
  autocmd Filetype bash,gitcommit let &commentstring="# %s"
  " Return to previous edit position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
  " autocmd BufRead * exe ':!test -w '.expand('%:p') | if v:shell_error ~= 0 | echoe "Cannot write file with current permissions!" | endif
  autocmd BufRead * lua require'write_perms'.check_perms()
augroup END
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
]]

vim.cmd [[
inoreabbr @@ devlin.ja@northeastern.edu
inoreabbr JD James Devlin

inoreabbr adn and
inoreabbr si is
inoreabbr ni in

cnoreabbr Q quit!

" Shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" Folding {{{
" Wraps a selection in fold-markers
vnoremap <silent> <Leader>f <Esc>`<O<Esc>`>o<Esc>`<kV`>jzf`<0a<Space><Esc>`>0a<Space><Esc>`<A<Space>

" }}}

" Move lines down with ctrl-j, or up with ctrl-k {{{
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" }}}

" Movement {{{
" Add Empty Lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
" }}}

command! Erc :edit $MYVIMRC
" Make file executable
command! Ex if !empty(expand('%'))
\|   write
\|   call system('chmod +x '.expand('%'))
\|   silent e
\| else
\|   echohl WarningMsg
\|   echo 'Save the file first'
\|   echohl None
\| endif

" Scratch {{{
" New vertical scratch window
command! Scratch vnew +Scratchify
nnoremap <Leader>ss :Scratch<CR>
" New horizontal scratch window
command! SScratch new +Scratchify
nnoremap <Leader>sS :SScratch<CR>
" New vertical scratch window
command! TScratch tabnew +Scratchify
nnoremap <Leader>sT :TScratch<CR>
" }}}

" Sudo write
command! Sudo w !sudo tee "%" > /dev/null
" See changes since last write
command! Chngs w !diff -y % -

" Wordcount current file {{{
function! Wordcount(filename)
  " Get the number of lines, words, and chars in a file
  let l:counts = split(system('wc -mlw '.a:filename))
  echo 'file:  '.a:filename
  echo 'lines: '.l:counts[0]
  echo 'words: '.l:counts[1]
  echo 'chars: '.l:counts[2]
endfunction
command! Wc call Wordcount(expand("%"))
" }}}
let g:is_bash = 1
let g:sh_fold_enabled = 3

]]

-- h:skeleton

-- local skel_dir = vim.fn.stdpath("data").."/site/skel/"
-- autocmd BufNewFile *.c 0r ~/vim/skeleton.c

-- if vim.cmd[[exists('g:neovide')]] then
-- end
require("lspconfig").bashls.setup {}

-- vim:fdm=marker
