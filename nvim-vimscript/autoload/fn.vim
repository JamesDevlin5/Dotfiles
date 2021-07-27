
" Create and Open a temporary (throwaway) scratch buffer {{{
function fn#MakeTempBuf()
    luaeval('print("ok")')
endfunction
"}}}
" Open scratch buffer {{{
function fn#Scratch()
    botright new
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal nobuflisted
endfunction
"}}}

" Toggle status line {{{
function fn#StatusToggle()
    if &laststatus == 2
        set laststatus=0
    else
        set laststatus=2
    endif
endfunction
"}}}

" Change directory to root of the git repo we're currently in {{{
function fn#Groot()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' root
    echo 'Changed directory to: '.root
  endif
endfunction
"}}}

" Searches through files below the cwd, displaying all TODO, FIXME, etc. tags {{{
function fn#Todo() abort
  let entries = []
  for cmd in ['git grep -niI -e TODO -e FIXME -e XXX 2> /dev/null',
            \ 'grep -rniI -e TODO -e FIXME -e XXX * 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if ! empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
"}}}

" Append modeline after last line in buffer {{{
" See: http://vim.wikia.com/wiki/Modeline_magic
function fn#AppendModeline()
	let l:modeline = printf(' vim: set ts=%d sw=%d fdm=%s :',
				\ &tabstop, &shiftwidth, &foldmethod)
	let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
	call append(line('$'), l:modeline)
endfunction
"}}}

" List occurrences of keyword under cursor, and jump to selected occurrence {{{
function fn#JumpOccurrence()
  let v:errmsg = ""
  exe "normal [I"
  if strlen(v:errmsg) == 0
    let nr = input("Which one: ")
    if nr =~ '\d\+'
      exe "normal! " . nr . "[\t"
    endif
  endif
endfunction
"}}}

" List occurrences of keyword entered at prompt, and jump to selected occurrence {{{
function fn#JumpPrompt()
  let keyword = input("Keyword to find: ")
  if strlen(keyword) > 0
    let v:errmsg = ""
    exe "ilist! " . keyword
    if strlen(v:errmsg) == 0
      let nr = input("Which one: ")
      if nr =~ '\d\+'
        exe "ijump! " . nr . keyword
      endif
    endif
  endif
endfunction
"}}}

" vim:foldmethod=marker
