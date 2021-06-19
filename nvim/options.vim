scriptencoding utf-8

" ========================================================================== "
" >>>                           EDITOR OPTIONS                           <<< "
" ========================================================================== "



"
" >>>>>>>>>>>>>>>     IMPORTANT
"

set nocompatible                                " Be iMproved
filetype indent plugin on                       " Enable Filetype Specific Behavior
syntax enable                                   " Syntax Highlighting

set hidden                                      " Don't Unload Closed Buffers
set autoread                                    " Automatically Re-Read File if Modified Externally

set updatetime=100

" Persistent undo
set undofile
set undodir=~/.vim/undo


"
" >>>>>>>>>>>>>>>     UI
"

"set termguicolors                              " Enable True Color
set background=dark                             " Dark Mode
"set cursorline                                 " Highlight Cursor Line
set number                                      " Show Line Number
" Always Show Sign Column
set signcolumn=yes
" Use Popup Menu Always
set completeopt+=menuone,noinsert,noselect
set cmdheight=4                                 " Number of Lines for Command-Line
set fillchars+=vert:\ 

set redrawtime=3000                             " Timeout for Highlighting (milliseconds)

"set showbreak=+++>                              " String to Prefix Wrapped Lines
set showbreak=\ ↪\ \ 
set scrolloff=6                                 " Number of Lines Always Above/Below the Cursor
set linebreak                                   " Wrap One a Break Character
set listchars=tab:>>,nbsp:~ 

set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨" set list to see tabs and non-breakable spaces

set matchpairs+=<:>


"
" >>>>>>>>>>>>>>>     TYPING
"
set tabstop=4 softtabstop=4 shiftwidth=4        " Tabs are 4 Spaces
set shiftround                                  " Round indentation
set smarttab expandtab                          " <Tab> inserts spaces
set autoindent smartindent                      " Indentation


"
" >>>>>>>>>>>>>>>     AUTO-COMMANDS
"

augroup md
    autocmd!
    autocmd BufEnter *.md set tabstop=2
    autocmd BufEnter *.md set softtabstop=2
    autocmd BufEnter *.md set shiftwidth=2
    autocmd BufEnter *.md set spell
augroup end



"
" >>>>>>>>>>>>>>>     MISCELLANEOUS
"

set ignorecase 				" Ignore Search Pattern Case
set smartcase 				" Smart Ignore Case
set laststatus=2 			" Always Show Statusline
set splitright 				" New Window Spawns to the Right
set shortmess=ixToOF		" Suppress Non-Useful Completion Messages
set nowritebackup 			" Don't Write a Backup File Before Overwriting
set nobackup 				" Don't Keep Backup After Overwriting


" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
