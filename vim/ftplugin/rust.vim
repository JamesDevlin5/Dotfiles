
command! Rtest !cargo test
command! Rcheck !cargo check
command! Rfmt !rustfmt %
let &formatprg='rustfmt'

augroup rust_fmt_on_save
    autocmd!
    autocmd BufWritePost <silent> *.rs Rfmt
augroup END

