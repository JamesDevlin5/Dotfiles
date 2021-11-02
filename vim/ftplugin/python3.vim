
set foldmethod=indent
"inoreabbr <buffer> def def():<Esc>2hi
"inoreabbr <buffer> class class:<Esc>i

let &formatprg='black --skip-magic-trailing-comma --quiet - 2>/dev/null'

" Creates a test file (<CWD>/test_<FILENAME>)
command! Tfile exe 'e '.expand("%:p:h")."/test_".expand("%:p:t")
" Runs tests
command! Pytest !pytest .

" Run file
command! Pyrun !python3 %
command! Pyi !python3 -i %

" List all classes (in loc list)
command! Cls lvim /^class/ % | lopen

augroup py_fmt_on_save
    autocmd!
    autocmd BufWritePost *.py silent !black --quiet %
augroup END
