
" Neovim Data Directory
let s:data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

" Ensure vim-plug is installed
if empty(glob(s:data_dir . '/autoload/plug.vim'))
    echom 'Vim-Plug Not Found! Installing...'
    silent execute '!curl -fLo '.s:data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Use SSH
"let g:plug_url_format = 'git@github.com:%s.git'
let s:plug_dir = s:data_dir . '/pack'
let s:plug_cfg_dir = stdpath('config') . '/packman/'

call plug#begin(s:plug_dir)

" -- Colors
Plug 'joshdick/onedark.vim'
Plug 'glepnir/oceanic-material'

" -- Editor Extensions
Plug 'euclidianAce/BetterLua.vim', {'for': 'lua'}
Plug 'kyazdani42/nvim-tree.lua'
"   -- Rainbow Parentheses
Plug 'p00f/nvim-ts-rainbow'

"   -- Formatting
Plug 'sbdchd/neoformat'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " [ Update Installed Parsers ]

" -- UI
"
"  Icons
Plug 'kyazdani42/nvim-web-devicons'
"  Status Line
Plug 'hoob3rt/lualine.nvim'

" -- Ease of Access
Plug 'junegunn/goyo.vim'
"  Git
Plug 'tpope/vim-fugitive'

" -- Local Plugins
"Plug 'junegunn/fzf', {
"            \ 'dir': '~/.fzf',
"            \ 'do': './install --bin'
"            \}
"   FZF Replacement
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" -- LISP
Plug 'kovisoft/paredit'
Plug 'vlime/vlime'

" -- Custom (WIP)
"Plug '~/workspace/nvim/nvim-todo-manager'

call plug#end()

packadd! matchit

let g:onedark_terminal_italics = 1

" let g:oceanic_material_background = "deep"
let g:oceanic_material_background = "medium"
let g:oceanic_material_allow_bold = 1
let g:oceanic_material_allow_italic = 1
let g:oceanic_material_allow_underline = 1
let g:oceanic_material_allow_undercurl = 1

let s:pack_cfg_dir = stdpath('config').'/packman/'
" Status Line
execute "luafile ".s:pack_cfg_dir.'lualine.lua'
" Explorer
"source s:pack_cfg_dir.'nvim_tree.vim'

" Rainbow
lua << EOF
require'nvim-treesitter.configs'.setup {
    rainbow = {
        enable = true,
        extended_mode = true, -- Find non-paren pairings as well
        max_file_lines = 1200, -- Max number of lines in file before bailing
        -- Colors
        colors = {
            "#00BCD4",
            "#80BC86",
            "#901850",
            "#F44336",
            "#FFEB3B",
            "#EBEBEB",
        },
        termcolors = {
            "Cyan",
            "LightRed",
            "LightYellow",
            "Green",
            "Blue",
            "White",
            "Magenta",
        },
    },
}
EOF

