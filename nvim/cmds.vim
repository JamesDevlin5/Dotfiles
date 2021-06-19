" Show file path
autocmd BufEnter * lcd %:p:h


" Open file at the same position it was closed
autocmd BufReadPost *
            \ if line("'\'") > 0 && line("'\'") <= line("$") |
            \ exe "normal! g`\"" |
            \ endif


" Start terminal in insert
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

" save read-only files
command -nargs=0 Sudow w !sudo tee % >/dev/null

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" Autoformat
"autocmd BufWritePre *.py 0,$!yapf
"autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>
" Doesn't work on error

" Spell check for markdown
autocmd FileType markdown setlocal spell

" Automatically wrap at 72 characters and spell check git commit messages
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell


autocmd FileType python nnoremap <buffer> <leader>r :w<Esc>:FloatermNew python3 %<CR>

nnoremap update :PlugUpdate<CR>


" Conceal text, replace with pretty glyphs
function! ToggleConcealLevel()
    if &conceallevel == 0
        setlocal conceallevel=2
    else
        setlocal conceallevel=0
    endif
endfunction

nnoremap <silent> <C-c><C-y> :call ToggleConcealLevel()<CR>
