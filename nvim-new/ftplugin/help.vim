
augroup help_enter
  autocmd!
  autocmd BufWinEnter <buffer> ++once wincmd L
  autocmd BufEnter,BufWinEnter <buffer> set scrolloff=999
  autocmd BufLeave <buffer> set scrolloff=10
augroup END

nnoremap <buffer> q :close<CR>
