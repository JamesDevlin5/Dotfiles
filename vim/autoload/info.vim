
" Locates all `augroup` blocks within the runtime path
function! info#augroups()
    let l:filelist = substitute(&rtp, ',', ' ', 'g')
    exe "!rg --trim -Tmarkdown -Tlicense -Tlock -Tlog -Tmake -Tmd -Treadme -Trst -Ttxt -e '^(?:\S*)augroup\s' ".l:filelist
endfunction

" Gets all the augroups defined, and places them in a scratch buffer for examination
function! info#listgroups()
    redir @g
    silent exe 'augroup'
    redir END
    let l:items = split(@g)
    call sort(l:items)
    call map(l:items, "' - '.v:val")
    new +Scratchify
    call setline(1, [ 'Augroups: ('.len(l:items).')', '' ] + l:items)
endfunction

