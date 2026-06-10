setlocal spell
setlocal wrap

function! EncodeImagePath() range
  for lnum in range(a:firstline, a:lastline)
    let line = getline(lnum)
    let new_line = substitute(line,
      \ '!\[\([^\]]*\)\](\([^)]*\))',
      \ '\=printf("![%s](%s)", submatch(1), substitute(submatch(2), " ", "%20", "g"))',
      \ 'g')
    call setline(lnum, new_line)
  endfor
endfunction

vnoremap <leader>f :<C-u>call EncodeImagePath()<CR>

