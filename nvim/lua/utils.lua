-- Helper functionality

local M = {}
local cmd = vim.cmd

function M.makeAugroup(groupName, autocmds)
  --[[
    Transforms the provided table into a list of autocommands.
    The input table must be a list of tables.
    Each inner table will be conjoined with spaces and executed with the autocommand prefix.
  --]]
  cmd('augroup '..groupName)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd '..table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

local scopes = {
  o = vim.o,
  b = vim.bo,
  w = vim.wo,
}

function M.makeOpt(scope, name, value)
  --[[
    Shortcut for defining options.
    The scope must be one of: 'o', 'b', or 'w'.
  --]]
    
  -- TODO
  scopes[scope][key] = value
  if scope ~= 'o' then
    scopes['o'][key] = value
  end
end

return M

