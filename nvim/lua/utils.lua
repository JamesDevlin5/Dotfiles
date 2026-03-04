
local utils = {}

function utils.is_vscode()
    return vim.fn.exists('g:vscode') == 1
end

-- Gets the text currently selected in visual selection mode
function utils.get_visual_selection()
    local mode = vim.api.nvim_get_mode().mode
    if mode ~= 'v' and mode ~= 'V' and mode ~= '\22' then return end

    -- Use getpos("v") and getpos(".") to get start and end
    local v_start = vim.fn.getpos("v")
    local v_end = vim.fn.getpos(".")

    -- Extract and return text using nvim_buf_get_text for efficiency
    return table.concat(vim.api.nvim_buf_get_text(
        0, v_start[2]-1, v_start[3]-1, v_end[2]-1, v_end[3], {}
    ), "\n")
end

return utils
