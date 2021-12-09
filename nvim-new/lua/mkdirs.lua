-- Creates all parent directories, if they do not exist, prior to writing

local fn = vim.fn
local M = {}

function M.make_dirs()
  local pwd = fn.expand "%:p:h"
  if fn.isdirectory(pwd) == 0 then
    fn.mkdir(pwd, "p")
  end
end

vim.cmd [[autocmd BufWritePre * lua require'mkdirs'.make_dirs()]]

return M
