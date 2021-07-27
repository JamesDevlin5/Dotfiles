
augroup customCommands
  autocmd!

  " Return to last edit position when opening files
  autocmd BufReadPost *
        \ if line("'\'") > 0 && line("'\'") <= line("$") |
        \ silent! execute "normal! g`\"" |
        \ endif
augroup END
    
let g:template_dir = expand("~/.config/nvim/templates") . '/'
" Skeleton files
augroup templates
    autocmd!
    autocmd BufNewFile *.sh     execute "0r " . g:template_dir . 'skel.sh'
    autocmd BufNewFile *.bash   execute "0r " . g:template_dir . 'skel.bash'
    autocmd BufNewFile *.py     execute "0r " . g:template_dir . 'skel.py'
augroup END

command MakeHelp execute ":helptags ~/.local/share/nvim/site/pack/*/*/*/doc/"

command AddFoldMarker execute "normal! i" . split(&foldmarker, ',')[0] . "\<Esc>"
command AddEndFoldMarker execute "normal! i" . split(&foldmarker, ',')[1] . "\<Esc>"

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
            \ | wincmd p | diffthis

command Time !date --rfc-email

" vim: set ts=4 sw=4 tw=100 et :
