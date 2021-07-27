
"au BufRead,BufNewFile * if &ft == 'sh' && getline(1) =~ '^#!.*\<bash\>' | set ft=bash | endif
autocmd FileType sh if getline(1) =~ '^#!.*\<bash\>' | set ft=bash | endif

