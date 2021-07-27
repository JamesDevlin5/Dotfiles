-- Commands
local cmd = vim.cmd

cmd( ":command! WQ wq" )
cmd( ":command! Wq wq" )
cmd( ":command! W w!" )
cmd( ":command! Q q!" )

-- Change Directory to that of the buffer selected
cmd(":command! Cdb cd %:h")

