
function! ShebangFtDetect(line)
    if a:line =~ '^#!'
        " Get last word
        let l:file_t = substitute(a:line, '^#!\S+\s\(\<\S+\>\)', '\1', '')
        let &filetype=l:file_t
    endif
endfunction

augroup detect_shebang_filetype
    autocmd!
    autocmd BufEnter * if &filetype == '' | call ShebangFtDetect(getline(1)) | endif
augroup END

