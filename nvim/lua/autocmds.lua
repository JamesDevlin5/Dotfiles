-- Any autocommands
local u = require( "utils" )

u.makeAugroup( "hlYank",
               { { "TextYankPost", "*", "lua vim.highlight.on_yank()" } } )

-- TODO: Fix this
-- u.makeAugroup('dashboard', {{'FileType dashboard', 'set showtabline=0', '|', 'autocmd WinLeave <buffer> set showtabline=2'}})

