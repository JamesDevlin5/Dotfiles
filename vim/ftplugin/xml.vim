
" Surround word with angle brackets
inoremap ,,, <C-o>diw<><C-o>P

augroup xml_lint
    autocmd!
    " Format document with `xmllint`
    autocmd BufWritePre <buffer> exe ":silent %!xmllint --format --recover - 2>/dev/null"
augroup END

