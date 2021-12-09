local M = {}
function M.run()
  local num_bars = 10
  local total = vim.api.nvim_buf_line_count(0)
  local curr = vim.api.nvim_win_get_cursor(0)[1]
  local num_vis = require("math").floor(num_bars * (curr / total))
  local vis_str = string.rep("", num_vis)
  local hidden_str = string.rep(" ", num_bars - num_vis)
  return table.concat { hidden_str, vis_str }
end
return M
