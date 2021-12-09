local M = {}
local api = vim.api
local cmd = vim.cmd

M.setup = function()
  cmd "autocmd TextYankPost * lua require'yankring'.copy()"
end

local new_pos = function(row, col)
  return {
    row = row,
    col = col,
  }
end
local mark_pos = function(mark)
  pos = api.nvim_buf_get_mark(0, mark)
  return new_pos(unpack(pos))
end

local copy_start_pos = function()
  return mark_pos "["
end

local copy_end_pos = function()
  return mark_pos "]"
end

M.copy = function()
  -- marks: '[, ']
  print(vim.inspect(copy_start_pos()))
  -- print(copy_start_pos()[1])
  -- print(vim.inspect(copy_end_pos()))
  -- local copied_lines = api.nvim_buf_get_lines(0, start_pos[1] - 1, end_pos[1], true)
  -- string.sub(copied_lines[0], start_pos[2], -1)
  -- string.sub(copied_lines[-1], 1, end_pos)
  -- -- local copied = string.sub(copied_lines, start_pos[2], end_pos[2] + 1)
  -- print(vim.inspect(copied_lines))
end

return M
