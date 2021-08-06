
augroup customCommands
  autocmd!

  " Return to last edit position when opening files
  autocmd BufReadPost *
        \ if line("'\'") > 0 && line("'\'") <= line("$") |
        \ silent! execute "normal! g`\"" |
        \ endif
augroup END
    
let g:template_dir = expand("~/.config/nvim/templates") . '/'
" Skeleton files
augroup templates
    autocmd!
    autocmd BufNewFile *.sh     execute "0r " . g:template_dir . 'skel.sh'
    autocmd BufNewFile *.bash   execute "0r " . g:template_dir . 'skel.bash'
    autocmd BufNewFile *.py     execute "0r " . g:template_dir . 'skel.py'
augroup END

command MakeHelp execute ":helptags ~/.local/share/nvim/site/pack/*/*/*/doc/"

command AddFoldMarker execute "normal! i" . split(&foldmarker, ',')[0] . "\<Esc>"
command AddEndFoldMarker execute "normal! i" . split(&foldmarker, ',')[1] . "\<Esc>"

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
            \ | wincmd p | diffthis

command Time !date --rfc-email

" use <Tab> as trigger keys
"imap <Tab> <Plug>(completion_smart_tab)
"imap <S-Tab> <Plug>(completion_smart_s_tab)
" Code navigation shortcuts
"nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
"nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
"" Set updatetime for CursorHold
"" 300ms of no cursor movement to trigger CursorHold
"set updatetime=300
"" Show diagnostic popup on cursor hold
"autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
"
"" Goto previous/next diagnostic warning/error
"nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
"" Enable type inlay hints
"autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
"\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
"
"
" vim: set ts=4 sw=4 tw=100 et :
