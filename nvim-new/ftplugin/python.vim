
setlocal foldmethod=indent
setlocal formatprg=black\ --skip-magic-trailing-comma\ --quiet\ -\ 2>/dev/null

command! Pyrun !python %
command! Pyi !python -i %
command! Pytest !pytest .

command! Cls lvim /^class/ % | lopen

