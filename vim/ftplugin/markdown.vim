
function! Pandoc()
    let fname = tempname()
    exe 'w !pandoc --table-of-contents --self-contained --from=markdown --to=html --output="'.fname.'" --metadata title="'.expand('%:t:r').'"'
    exe '!open -a firefox '.fname
    call delete(fname)
endfunction

function! MdFold(line)
    " Start-of-line (Whitespace) `#`*
    let hashes = substitute(a:line, '^\s*\(#\+\)\?.*', '\1', '')
    let l:num = strlen(hashes)
    " If no header on line, keep previous foldlevel
    if l:num == 0
        return -1
    else
        return l:num
    endif
endfunction

set spell
set foldmethod=expr
set foldexpr=MdFold(v:line)

nnoremap <Leader>v :Goyo<CR>
nnoremap <Leader>p :call Pandoc()<CR>

" Populates location list with header tags
command! Headers lvimgrep /^#\+/ % | lopen
nnoremap <Leader>h :Headers<CR>

