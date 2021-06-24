filetype plugin indent on
syntax enable

if has('termguicolors')
    set termguicolors
endif

let s:config_dir = expand("~") . "/.config/nvim/"
let s:config_files = [
            \ "keys.vim",
            \ "packcfg.vim",
            \ "opts.vim",
            \ "cmds.vim",
            \ ]

for f in s:config_files
    try
	    execute "source " . s:config_dir . f
    catch /^Vim\%((\a\+)\)\=:E484/
        echom 'Could not find file: "' . f . '"... '
    endtry
endfor

colorscheme onedark

