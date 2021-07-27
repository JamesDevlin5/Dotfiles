" Leader
let mapleader=" "
nnoremap <Space> <Nop>

" Down
nnoremap <Down> 10jzz
"nnoremap <Down> <C-E>
"nunmap <S-Down>

" Up
nnoremap <Up> 10kzz
"nnoremap <Up> <C-Y>
"nunmap <S-Up>

" Writing
cnoreabbrev W :write!
nnoremap <Leader>w :write<CR>
inoremap <C-S> <C-O>:write<CR>
nnoremap <C-S> :write<CR>

" Quitting
cnoreabbrev Q q!
cnoreabbrev WQ wq!
cnoreabbrev Wq wq!
cnoreabbrev wQ wq!
inoremap <C-Q> <Esc>:q<CR>
nnoremap <Leader>q :bdelete<CR>
vnoremap <C-Q> <Esc>
nnoremap <Leader>x :close<CR>

" Copy & Paste
nnoremap p gp
nnoremap P gP

" Ease of access
inoremap jj <Esc>
nnoremap H ^
nnoremap L $
"nnoremap Q qq
nnoremap <silent> Y y$
inoremap <C-W> <Nop>

nnoremap <Leader>k :call fn#JumpOccurrence()<CR>
"nnoremap <Leader>p :call fn#JumpPrompt()<CR>


" Buffers
"nnoremap <C-N> :bnext<CR>
"nnoremap <C-P> :bprev<CR>
" Tabs
"nnoremap <C-S-N> :tabnext<CR>
"nnoremap <C-S-P> :tabprev<CR>
" Windows
nnoremap <Leader>o <C-W>o

" Quickfix
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz
" Buffers
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
" Tabs
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>
" Windows
nnoremap ]w <C-W>w
nnoremap [w <C-W>W

" Visual shifting
vnoremap < <gv
vnoremap > >gv

" Config shortcuts
cnoreabbrev ec e $MYVIMRC
"cnoreabbrev ecd execute "edit " . fnamemodify($MYVIMRC, ":h")
cnoreabbrev sc source $MYVIMRC
"cnoreabbrev plug $HOME/.local/share/nvim/site/

cnoreabbrev H vertical botright help

" Mouse scrolling
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

" Terminal
cnoreabbrev tt terminal
tnoremap <Esc> <C-\><C-N>
tmap <C-X> <Esc><C-W>q

" Aesthetics
nnoremap <silent> <Leader>i :nohlsearch<CR>
nnoremap <silent> <Leader>p :echom expand('%:p:~')<CR>

" Insertion shortcuts
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)
nnoremap ! :!

"cnoremap plua lua print(vim.inspect(  ))<Left><Left><Left>
nnoremap <Leader>sf :call SourceFile(expand("%"))<CR>

" Ctrl+Backspace deletes previous word
"inoremap <C-Bs> <C-\><C-O>dB

" Display info
"nnoremap <silent> <Leader>` :marks<CR>
"nnoremap <silent> <Leader>r :registers<CR>
"nnoremap <silent> <Leader>a :args<CR>
"nnoremap <silent> <Leader>t :tabs<CR>
"nnoremap <silent> <Leader>f :files<CR>
"nnoremap <silent> <Leader>b :buffers<CR>
"nnoremap <silent> <Leader>j :jumps<CR>
"nnoremap <silent> <Leader>g :tags<CR>
"nnoremap <silent> <Leader>h :history<CR>

" Popup menu
"   -- Enter key selects highlighted completion
inoremap <silent> <expr> <CR> pumvisible() ? "\<C-Y>" : "\<C-G>u\<CR>"
inoremap <silent> <expr> <Esc> pumvisible() ? "\<C-E>" : "\<Esc>"

"   -- Quickfix List ( `qf' )
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cp :cprev<CR>
nnoremap <Leader>co :copen<CR>

"   -- Location List ( `ll' )
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lp :lprev<CR>
nnoremap <Leader>lo :lopen<CR>

"   -- File Explorer
"nnoremap <Leader>E :Explore .<CR>
nnoremap <Leader>e :NvimTreeToggle<CR>
"nnoremap <silent> <expr> <Leader>e bufexists(bufnr('/netrw" :Vexplore<CR>

" ---   Extras
" Fuzzy finder
nnoremap <silent> <Leader>f :FZF<CR>

