
if exists("g:netrw_config_loaded")
    finish
endif

let g:netrw_config_loaded = 1

" Options {{{

let g:netrw_list_hide= netrw_gitignore#Hide().join(['^\.netrwhist$', '^\.netrwbook$', '^\.DS_Store$'], ',')

let g:netrw_liststyle=3
let g:netrw_preview=1
let g:netrw_special_syntax=1

let g:netrw_localcopycmdopt='--interactive --dereference --verbose'
let g:netrw_localmkdiropt='--parents --verbose'
let g:netrw_localmovecmdopt='--interactive --verbose'
let g:netrw_localrmdiropt='--verbose'

let g:netrw_sizestyle="H"
let g:netrw_sort_options="i"

"}}}

" vim: set ts=4 sw=4 tw=100 et fdm=marker :
