return {
  new = function()
    local columns = vim.o.columns
    local rows = vim.o.lines
    local width = math.min(columns - 4, math.max(80, columns - 20))
    local height = math.min(rows - 4, math.max(20, rows - 10))
    local top = ((rows - height) / 2) - 1
    local left = (columns - width) / 2
    local opts = {
      relative = "editor",
      row = top,
      col = left,
      width = width,
      height = height,
      style = "minimal",
    }
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, opts)
    vim.api.nvim_win_set_option(win, "winhl", "Normal:NormalFloat")
    opts.row = opts.row + 1
    opts.height = opts.height - 2
    opts.col = opts.col + 2
    opts.width = opts.width - 4
    vim.api.nvim_open_win(vim.api.nvim_create_buf(false, true), true, opts)
    vim.cmd([[autocmd! BufWipeout <buffer> execute 'bw ']] .. buf)
  end,
}
