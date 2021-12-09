local M = {}

M.scratchify = function(win_handle)
  if not win_handle then
    win_handle = 0
  end
  local function setopt(key, val)
    vim.api.nvim_buf_set_option(win_handle, key, val)
  end
  setopt("buflisted", false)
  setopt("buftype", "nofile")
  setopt("bufhidden", "delete")
  setopt("swapfile", false)
end

M.new = function()
  vim.api.nvim_create_buf(false, true)
end

return M
