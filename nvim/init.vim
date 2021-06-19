scriptencoding utf-8

let s:config_dir = expand("~") . '/.config/nvim/'
let s:files = [
            \ 'plugins',
            \ 'keys',
            \ 'cmds',
            \ 'options',
            \ ]

colo hybrid_material

for f in s:files
    try
        execute 'source ' . s:config_dir . f . '.vim'
    catch /^Vim\%((\a\+)\)\=:E484/
        echom 'Could not find file: "' . f . '"... '
    endtry
endfor
