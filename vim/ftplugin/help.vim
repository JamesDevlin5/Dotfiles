
augroup help_file_format
    autocmd!
    autocmd BufEnter * if &buftype == 'help' |
                \ wincmd L |
                \ set scrolloff=999 nocul |
                \ endif
    autocmd BufLeave * if &buftype == 'help' | set scrolloff=10 cul | endif
augroup END

nnoremap <buffer> q :close<CR>

