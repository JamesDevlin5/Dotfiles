if exists("current_compiler") | finish | endif

let current_compiler = "pylint"
setlocal makeprg=pylint\ %
setlocal errorformat=%f:%l:\ %m

