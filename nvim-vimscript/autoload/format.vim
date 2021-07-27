
" Default formatter ~ From helpfiles
"
" Removes any and all trailing whitespace, only when explicitly called.

func! format#Format()
  " only reformat on explicit gq command
  if mode() != 'n'
    " fall back to Vim's internal reformatting
    return 1
  endif
  let lines = getline(v:lnum, v:lnum + v:count - 1)
  call map(lines, {key, val -> substitute(val, '\s\+$', '', 'g')})
  call setline('.', lines)
  " Ensure there is an empty line following file contents
  if getline('$') =~ '^$'
    append(line('$'), '')
  endif
  
  " do not run internal formatter!
  return 0
endfunc

" You can then enable the formatting by executing: >
" setlocal formatexpr=format#Format()
