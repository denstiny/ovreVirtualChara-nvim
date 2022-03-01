-- @author      : aero (2254228017@qq.com)
-- @file        : init
-- @created     : 星期二 3月 01, 2022 17:18:52 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local M = require("OverVirTool.OverVirTualChara")

vim.g.OverVirTualChara_c = '⤵'
function M.initVirTool()
  if M.fileRules() == true then
    return
  end
  local cur_line =  vim.fn.line('.')
  local max_line = vim.fn.line('$')
  local count = 0
  for line_num = cur_line-40, cur_line+40,1 do
    if line_num > 0 and line_num <= max_line then
      if M.filterVirsiBle(line_num) == true then
        count = count + 1
        M.StartVisible(line_num,-1,vim.g.OverVirTualChara_c,count)
      end
    end
  end
end
-- M.initVirTool()
vim.cmd[[ 
augroup MyFunVirReturnTextFun
  au!
  au TextChanged,InsertLeave * lua require('overvir').initVirTool() 
  au InsertEnter,VimEnter,InsertLeave,CursorMovedI,TextChanged,CursorMoved * lua require('overvir').initVirTool() 
augroup END
]]
return M
