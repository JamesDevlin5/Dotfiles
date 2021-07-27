set encoding=utf-8

set number
set cursorline
" Allotted time (in ms) for a mapped sequence (keybinding) to complete
"set timeoutlen=750

" Change to buffer's directory
"set autochdir
set switchbuf=useopen,vsplit

" Create a backup file, temporarily
set backupext=.bak~ backupdir=$HOME/.local/share/nvim/site/backup
" Undo
set undofile undodir=$HOME/.local/share/nvim/site/undo

set hidden
set clipboard+=unnamedplus

set cursorline
set concealcursor=nc conceallevel=2
set virtualedit=block
set inccommand=split

set fillchars=vert:⦚,foldopen:▾,foldclose:►,foldsep:~,eob:⨯

" Mouse
set mouse=nvi "mousefocus

" Minimal desired height of a window
" .. width ..
" .. command-line ..
set winheight=7 winwidth=20 cmdheight=4
" Hard minimum height
" .. width ..
set winminheight=5 winminwidth=15

" Equalize window sizes when opened/closed
set equalalways
" New windows appear adjacent
set splitright

" Popup Windows
set pumheight=16
set infercase
" Always show complete popup
set completeopt=menuone

" Folding
set foldlevelstart=1 foldnestmax=10 foldcolumn=2
set foldopen-=hor
set signcolumn=auto:3

" Sane wrapping
set linebreak breakindent
" Wrapped line prefix
let &showbreak = '--> '
" Hard wrap
set textwidth=100
set nojoinspaces

set scrolloff=5

set ignorecase smartcase
set showmatch
set matchtime=8
set wildmenu
set wildchar=<Tab>
set wildignore+=*.o,.DS_Store,.netrwhist,*~,*.swp,*.tmp
set wildignorecase
set fileignorecase

"set listchars=trail:·,nbsp:·,extends:>,precedes:<,eol:$
set listchars=eol:$,tab:<->,space:_,trail:@,extends:~,precedes:~
" Tabs -> Spaces
set expandtab smarttab shiftwidth=4 shiftround tabstop=4

" Verbose Messages
set shortmess=ixtoI
set formatoptions=rb1jptn
set cpoptions-=A
set cpoptions+=oPZ;_+
" Offer to save when leaving
set confirm
set startofline


if executable('rg')
    set grepformat=%f:%l:%c:%m
    let &grepprg = 'rg --vimgrep --trim --no-heading' . (&smartcase ? ' --smart-case' : '') . ' --'
endif

