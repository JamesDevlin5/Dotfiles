
" Saves the file, then opens it in firefox
command! View write | exe '!open -a firefox '.expand("%:p")
nnoremap <buffer> <Leader>p :View<CR>

