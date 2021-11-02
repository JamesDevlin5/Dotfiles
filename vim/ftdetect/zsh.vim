
augroup detect_zsh_filetype
    autocmd!
    autocmd BufEnter .\?zshrc,.zshenv,*.zsh set filetype=zsh
augroup END

