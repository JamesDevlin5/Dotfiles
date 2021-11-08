
" Print a number in different bases
function! util#PrintNum(num)
    echo printf("Dec: %d", a:num)
    echo printf("Hex: %x", a:num)
    echo printf("Oct: %o", a:num)
    "printf("Bin: %b", a:num)
endfunction

" Create a skeleton file for some filetype
function! util#MakeSkel()
    let ft_target = input("Create a skeleton for which filetype? ", "", "filetype")
    if ft_target == '' | echom "No filetype given. Exiting..." | return | endif
    let skel_target = g:skel_dir.'/skel.'.ft_target
    exe 'e '.skel_target
    let &filetype=ft_target
    echo expand('%:p:~')
endfunction

