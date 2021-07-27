
local findNetrwBuf = function()
    -- All tab windows
    local tab_windows = vim.api.nvim_tabpage_list_wins("")
    for _, window in ipairs(tab_windows) do
        local buf_handle = vim.api.nvim_win_get_buf(window)
        local buf_ft = vim.api.nvim_buf_get_option(buf_handle, "filetype")
        if buf_ft == "netrw" then
            print(buf_handle)
        end
    end
end

function MakeTempBuf()
    local buf = vim.api.nvim_create_buf(1, 1)
    if not buf then
        vim.api.nvim_err_writeln("Could not create temporary buffer!")
        return -1
    end
    vim.api.nvim_buf_set_name(buf, "Temporary Buffer")
    vim.api.nvim_buf_set_option(buf, "bufhidden", "hide")
    return buf
end

function BindBuf2Win(buffer, window)
    if buffer == nil then
        vim.api.nvim_err_writeln("Cannot bind a null buffer to a window!")
        return
    end
    -- TODO
end

print(MakeTempBuf())

