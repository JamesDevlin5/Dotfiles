" Remap Leader
let mapleader=';'

" >>>>>>>>>>>>>>>     General
"

" Personal Info
inoreabbrev @@ Devlin.ja@northeastern.edu


" Writing
cnoreabbrev W w!
cnoreabbrev WQ wq!
cnoreabbrev Wq wq!
nnoremap <Leader>w :w<CR>

inoremap <C-d> <Esc>dd

" Quitting
cnoreabbrev Q q!
cnoreabbrev QA qa!
cnoreabbrev Qa qa!
nnoremap <Leader>q :q<CR>

" Escaping
inoremap jj <Esc>

" Moving
nnoremap <k8> k
nnoremap <k2> j
nnoremap <k4> h
nnoremap <k6> l

" Visual Shifting
vnoremap < <gv
vnoremap > >gv

" Copy to EOL
nnoremap Y y$

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard
inoremap <C-v> <Esc>"+p

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]

""  " Terminal
nnoremap <silent> <Leader>tt :terminal<CR>
nnoremap <silent> <Leader>tv :vnew<CR>:terminal<CR>
nnoremap <silent> <Leader>th :new<CR>:terminal<CR>
""  tnoremap <C-x> <C-\><C-n><C-w>q

""  " Edit/Source This Config File
nnoremap <silent> <Leader>ec :e $VIMRC<CR>
nnoremap <silent> <Leader>sc :source $VIMRC<CR>

" Highlighting
nnoremap <Leader><Space> :nohlsearch<CR>

" Quoting
nnoremap <Leader>" viw<Esc>a"<Esc>bi"<Esc>lel

" Where am i
nnoremap <Leader>p :echom expand('%:p')<CR>

" Automatically closing brackets
inoremap {<CR> {<CR>}<ESC>O

" >>>>>>>>>>>>>>>     Switching Buffers
"

" Switch between current and last buffer
nnoremap <silent> <Leader>bb <C-^>

" Go to next buffer
nnoremap <silent> <Leader>bn :bn<CR>

" Go to previous buffer
nnoremap <silent> <Leader>bp :bp<CR>

" Close buffer
nnoremap <silent> <Leader>bd :bd<CR>

" Kill buffer
nnoremap <silent> <Leader>bk :bd!<CR>

" List buffers
nnoremap <silent> <Leader>bl :ls<CR>

" List and select buffer
nnoremap <silent> <Leader>bg :ls<CR>:buffer<Space>

" Horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" Vertical split with new buffer
nnoremap <silent> <Leader>bv :vnew<CR>



" >>>>>>>>>>>>>>>     Switching Windows
"

" Selecting windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Close window
nnoremap <Leader>c :close<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Resizing
nnoremap <C-H> :vertical resize -5<CR>
nnoremap <C-J> resize +5<CR>
nnoremap <C-K> resize -5<CR>
nnoremap <C-L> :vertical resize +5<CR>

" Magic
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" cd vim into the directory of the buffer
nnoremap <Leader>cd :cd %:p:h<CR>

" Allow switching to buffer #<n> by typing <n>e
function! s:bufSwitch(count)
    if count >=# 1
        return ":\<C-U>" . count . "b\<CR>"
    endif
    return 'e'
endfunction
nnoremap <expr> e <SID>bufSwitch(v:count)

" Next/Prev Buffer
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Move to beginning/end of line
nnoremap H ^
nnoremap L $

" Q key macros
"nnoremap Q @q

" FZF
nnoremap <leader>f :FZF<CR>

" Undo tree
"nnoremap <leader>u :MundoToggle<CR>


""   >>>>>>>>>>>>>>>     Switching Tabs
"" "
"" nnoremap tt :tabnew<CR>
"" nnoremap <C-t> :tabnew<CR>
"" nnoremap <C-n> :tabn<CR>
"" nnoremap <C-N> :tabp<CR>
"" inoremap <C-t> <Esc>:tabnew<CR>
"" nnoremap tc :tabclose<CR>

au FileType rust nnoremap gd <Plug>(rust-def)
au FileType rust nnoremap gs <Plug>(rust-def-split)
au FileType rust nnoremap gx <Plug>(rust-def-vertical)
au FileType rust nnoremap gt <Plug>(rust-def-tab)
au FileType rust nnoremap <leader>gd <Plug>(rust-doc)

" Floating Window
nnoremap <leader>t :FloatermToggle<CR>


" Open File in VS Code
nnoremap <leader>ov :exe ':silent !code %'<CR>:redraw!<CR>

