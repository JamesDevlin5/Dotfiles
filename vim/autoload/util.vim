
function! util#PrintNum(num)
    echo printf("Dec: %d", a:num)
    echo printf("Hex: %x", a:num)
    echo printf("Oct: %o", a:num)
    "printf("Bin: %b", a:num)
endfunction

