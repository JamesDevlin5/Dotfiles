
" Saves the file, then opens it in firefox
command! View write | exe '!open -a firefox '.expand("%:p")
nnoremap <buffer> <Leader>p :View<CR>

" Creates a div, with an optional id
let g:surround_{char2nr("d")} = "<div\1id: \r..*\r id=\"&\"\1>\r</div>"

