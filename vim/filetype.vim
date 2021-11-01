
augroup detect_filetype
    autocmd!
    autocmd BufEnter *.txt set filetype=text
    autocmd BufEnter *.sh set filetype=sh
    autocmd BufEnter .bashrc,*.bash set filetype=sh,bash
    autocmd BufEnter .zshrc,.zshenv,*.zsh set filetype=sh,bash,zsh
    autocmd BufEnter .vimrc,*.vim set filetype=vim
    autocmd BufEnter *.lua set filetype=lua
    autocmd BufEnter *.ya\?ml set filetype=yaml
    autocmd BufEnter *.md,*.markdown,*.rst set filetype=markdown
    autocmd BufEnter *.py set filetype=python
    autocmd BufEnter *.java set filetype=java
    autocmd BufEnter *.rs set filetype=rust
    autocmd BufEnter *.toml set filetype=toml
    autocmd BufEnter * if &filetype == '' | call ShebangFtDetect(getline(1)) | endif
augroup END

function! ShebangFtDetect(line)
    if a:line =~ '^#!'
        " Get last word
        let l:file_t = substitute(a:line, '^#!\S+\s\(\<\S+\>\)', '\1', '')
        let &filetype=l:file_t
    endif
endfunction

