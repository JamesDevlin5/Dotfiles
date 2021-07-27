

local a = vim.api

function MkTempWin()
    local buf = a.nvim_create_buf(1, 1)
    if not buf then
        a.nvim_err_writeln("Could not create temporary buffer!")
        return -1
    end
    vim.cmd("new")
    a.nvim_win_set_buf(0, buf)
end

