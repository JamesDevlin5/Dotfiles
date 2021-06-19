" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S_TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support
"""let g:lightline = {
"""            \ 'colorscheme': 'one',
"""            \ 'active': {
"""            \   'left': [ [ 'mode', 'paste' ],
"""            \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"""            \ },
"""            \ 'component_function': {
"""            \   'cocstatus': 'coc#status'
"""            \ },
"""            \ }
"""" Use auocmd to force lightline update
"""autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Rename
nmap <silent> <F2> <Plug>(coc-rename)

" Navigate Diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show Documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
