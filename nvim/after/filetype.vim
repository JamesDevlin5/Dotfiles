
augroup filetypeconf
    au!

    " Setup tmux conf files
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux

augroup END
