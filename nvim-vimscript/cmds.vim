if exists("g:custom_commands_loaded")
    finish
endif

let g:custom_commands_enabled = 1

augroup customCommands
    autocmd!

    " Display file path
    "autocmd BufAdd * lcd %:p:h
    
    " Return to last edit position when opening files
    autocmd BufReadPost *
                \ if line("'\'") > 0 && line("'\'") <= line("$") |
                \ silent! execute "normal! g`\"" |
                \ endif
    
    autocmd BufWritePre * call AddEOF()

    " Highlight matches only in current buffer
    "autocmd CmdlineEnter /,\? :setlocal hlsearch
    "autocmd CmdlineLeave /,\? :setlocal nohlsearch
augroup END

function AddEOF()
    if getline("$") !~ '^$\| vim:.*'
        let l:fname = "[ ". expand("%:p:~") ." ]"
        if ! append(line("$"), "")
            echohl WarningMsg | echom l:fname .": Added EOL" | echohl None
        else
            echohl ErrorMsg | echom l:fname . ":Unable to add EOL" | echohl None
        endif
    endif
endfunction

augroup vimStartup
    autocmd!
    "autocmd VimEnter * if expand("%") == "" | :Explore . | endif
augroup END

augroup highlightYankedText
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {timeout=600}
augroup END

" Bind utility functions defined in children to namespace
command Scratch call fn#Scratch()
command Stat call fn#StatusToggle()
command Groot call fn#Groot()
command Todo call fn#Todo()
command AppMline call fn#AppendModeline()

nnoremap <Leader>ml :AppMline<CR>

let g:template_dir = expand("~/.config/nvim/templates") . '/'
" Skeleton files
augroup templates
    autocmd!
    autocmd BufNewFile *.sh     execute "0r " . g:template_dir . 'skel.sh'
    autocmd BufNewFile *.bash   execute "0r " . g:template_dir . 'skel.bash'
    autocmd BufNewFile *.py     execute "0r " . g:template_dir . 'skel.py'
augroup END

" Plugins
"command PlugUpdate execute "!git -C ~/.local/share/nvim/site/pack submodule update --init --recommend-shallow"
"command PlugView execute 'vnew|0r !exa --tree --list-dirs --level 3 ~/.local/share/nvim/site/pack'
command MakeHelp execute ":helptags ~/.local/share/nvim/site/pack/*/*/*/doc/"

command AddFoldMarker execute "normal! i" . split(&foldmarker, ',')[0] . "\<Esc>"
command AddEndFoldMarker execute "normal! i" . split(&foldmarker, ',')[1] . "\<Esc>"

command Time !date --rfc-email

" vim: set ts=4 sw=4 tw=100 et :
