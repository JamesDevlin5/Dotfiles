
function! Pandoc()
    let fname = tempname()
    exe 'w !pandoc --table-of-contents --self-contained --from=markdown --to=html --output="'.fname.'" --metadata title="'.expand('%:t:r').'"'
    exe '!open -a firefox '.fname
    call delete(fname)
endfunction

set spell
set matchpairs+=`:`,*:*,_:_,~:~,<:>

nnoremap <Leader>p :call Pandoc()<CR>

" Populates location list with header tags
command! Headers lvimgrep /^#\+/ % | lopen
nnoremap <Leader>h :Headers<CR>

nnoremap ]c :.,/^#/<CR>
nnoremap [c :.,?^#?<CR>

nnoremap <Leader>t :Toc<CR>
