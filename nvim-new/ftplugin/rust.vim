
setlocal formatprg=rustfmt

command! Rtest !cargo test
command! Rcheck !cargo check
command! Rfmt !cargo fmt

