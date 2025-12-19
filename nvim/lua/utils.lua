
local utils = {}

function utils.is_vscode()
    return vim.fn.exists('g:vscode')
end

return utils
