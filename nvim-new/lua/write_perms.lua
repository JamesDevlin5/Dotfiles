-- Checks whether the user has write permissions for the file, and prints an error
-- message if not
--
-- Usually, when a file in `/etc/` is edited, an error is printed when write is attempted
-- after making changes. The output may be `tee`'d to a sudo write command, but this
-- utility will help in addition to this.

local M = {}

function M.check_perms()
  local filepath = vim.fn.expand "%:p"
  local exit_code = os.execute("/usr/bin/test -w " .. vim.fn.expand "%:p")
  if vim.o.buftype == "help" then
    return
  end
  if exit_code ~= 0 then
    vim.notify { "User does not have write permissions for this file!", "warn" }
  end
end

return M
