
setlocal shiftwidth=2 tabstop=2 softtabstop=2
setlocal spell noshowmatch

"let b:match_words = '\(\*\{1,2}\):\1,^```:^```$,`:`,%[!][[].*[]]:(.*)'

function! TOC()
  silent lgrep! "^[\#]{1,6}" %
endfunction



