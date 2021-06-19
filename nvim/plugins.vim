
" ========================================================================== "
" >>>                           PLUGIN SOURCES                           <<< "
" ========================================================================== "



" >>>>>>>>>>>>>>>     FILES
"
let s:vim_plug_dir = '~/.local/share/nvim/site/autoload/plug.vim'
let s:plugins_dir = '~/.config/nvim/plugged'

let s:opts_dir='~/.config/nvim/opts/'
let s:opt_files = [
            \ 'startify.vim',
            "\ 'nnn.vim',
            "\ 'syntastic.vim'
            \ 'coc.vim'
            \ ]



" >>>>>>>>>>>>>>>     AUTOMATIC VIM-PLUG INSTALLATION
"
if empty(glob(s:vim_plug_dir))
    echo "Installing Vim-Plug...\n"
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    silent autocmd VimEnter * PlugUpdate
endif



" >>>>>>>>>>>>>>>     PLUGINS
"
call plug#begin(s:plugins_dir)

" Plugin Manager
Plug 'junegunn/vim-plug'

" Start Screen
Plug 'mhinz/vim-startify'

" Visual Indentation Guide
Plug 'Yggdroot/indentLine'

" Highlight Yank
Plug 'machakann/vim-highlightedyank'

" Git Diff Gutter
Plug 'airblade/vim-gitgutter'

" Git Wrapper
Plug 'tpope/vim-fugitive'

" Status Line
Plug 'itchyny/lightline.vim'

" Auto bracket pairing
Plug 'jiangmiao/auto-pairs'

" Completion preview in floating window
"Plug 'ncm2/float-preview.nvim'

" Use terminal in popup window
Plug 'voldikss/vim-floaterm'

" Buffer Explorer
"Plug 'jeetsukumaran/vim-buffergator'

" Fuzzy Finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

" Parser
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update


" COLORS
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhinz/vim-janah'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'sainnhe/sonokai'
Plug 'vim-scripts/wombat256.vim'

" LSP
" Selection
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" TOML Filetype
Plug 'cespare/vim-toml'

" Rust
Plug 'rust-lang/rust.vim'

" Omnicomplete
"Plug 'racer-rust/vim-racer'

" View register contents
Plug 'tversteeg/registers.nvim'

" Floating types
Plug 'kshenoy/vim-signature'

" Vem
Plug 'pacha/vem-tabline'

" Melange colo
Plug 'savq/melange'


call plug#end()

""" Vem Tabline
"let g:vem_tabline_show: 2
"let g:vem_tabline_show_number: 'buffnr'

""" Float Term
" Dock preview window
"let g:float_preview#docked=1
" Full width
let g:floaterm_width = 100


" Terminal does support italics
let g:onedark_terminal_italics = 1


" >>>>>>>>>>>>>>>     PLUGIN OPTIONS

" >>>>>>>>>>     Vim Plug
"

" Number of Retries In Case of Timeout
let g:plug_retries = 4
" Format to Apply to Repo URIs
" let g:plug_url_format = 'git@github.com:%s.git'


" >>>>>>>>>>     GitGutter
"

let g:gitgutter_override_sign_column_highlight = 0

let g:gitgutter_sign_added = "\u002B"
let g:gitgutter_sign_modified = "\u21C4"
let g:gitgutter_sign_removed = "\u2212"
let g:gitgutter_sign_removed_first_line = "\u21A5"
let g:gitgutter_sign_modified_removed = "\u2213"

"autocmd User GitGutter call updateMyStatusLine()


" >>>>>>>>>>     Indent Line
"
" Indent Line Characters per Level
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Disable for Startify Buffers
let g:indentLine_bufNameExclude = [ 'Startify' ]


" >>>>>>>>>>     Lightline
"

function! LightlineFilename()
    return expand('%:t') != '' ? expand('%:t') : '[No Name]'
endfunction

let g:lightline = {
            \ 'active': {
            \   'left': [
            \       [ 'mode', 'paste' ],
            \       [ 'gitbranch', 'readonly', 'filename', 'modified' ]
            \   ],
            \   'right': [ 
            \       [ 'lineinfo' ],
            \       [ 'percent' ],
            \       [ 'filetype' ]
            \   ]
            \ },
            \ 'inactive': {
            \   'left': [
            \       [ 'readonly', 'filename', 'modified' ]
            \   ],
            \   'right': [
            \       [ 'lineinfo' ],
            \       [ 'percent' ]
            \   ]
            \ },
            \ 'tabline': {
            \   'left': [
            \       [ 'tabs' ]
            \   ],
            \   'right': [
            \       [ 'close' ]
            \   ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \   'filename': 'LightlineFilename',
            \ },
            \ 'colorscheme': 'deus',
            \ }


" >>>>>>>>>>     Pairs
"
autocmd FileType vim let b:coc_pairs_disabled = ['"']


" >>>>>>>>>>     Highlighted Yank
"

" Number of milliseconds to remain highlighted
let g:highlightedyank_highlight_duration = 1600

"let g:racer_cmd = "/usr/bin/racer"
"let g:racer_experimental_completer = 1
"let g:racer_insert_paren = 1


" Deoplete
"let g:deoplete#enable_at_startup = 1


" Language Client
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls']
    \ }

"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> <leader>c :call LanguageClient#textDocument_codeAction()<CR>
" nnoremap <silent> <leader>e :call LanguageClient#explainErrorAtPoint()<CR>



" Rust

" Rust format on save
let g:rustfmt_autosave = 1


" FZF
nnoremap <leader>s :Files<CR>


" Buftabline
let g:buftabline_numbers = 1

" >>>>>>>>>>>>>>>     AUTOMATIC OPTIONS
"

for f in s:opt_files
    try
        execute 'source ' . s:opts_dir . f
    catch /^Vim\%((\a\+)\)\=:E484/
	    echom 'Could not load plugins option file: "' . f . '"... '
    endtry
endfor


" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
