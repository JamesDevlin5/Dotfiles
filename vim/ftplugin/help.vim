
augroup help_file_format
    autocmd!
    autocmd BufWinEnter * if &buftype == 'help' | wincmd L | endif
    autocmd BufEnter * if &buftype == 'help' | set scrolloff=999 | endif
    autocmd BufLeave * if &buftype == 'help' | set scrolloff=10 | endif
augroup END

nnoremap <buffer> q :close<CR>

