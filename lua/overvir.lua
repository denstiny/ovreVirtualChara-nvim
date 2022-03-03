-- @author      : aero (2254228017@qq.com)
-- @file        : init
-- @created     : 星期二 3月 01, 2022 17:18:52 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local M = require("OverVirTool.OverVirTualChara")
function M.initVirTool()
  if M.fileRules() == true then
    return
  end
  local cur_line =  vim.fn.line('.')
  local max_line = vim.fn.line('$')
  local count = 0
  for line_num = cur_line-M.scope, cur_line+M.scope,1 do
    if line_num > 0 and line_num <= max_line then
      count = count + 1   -- id 
      local mrk = M.StartVisible(line_num,-1,M.OverVirTualChara_c,count) -- 创建虚拟文本
      if mrk ~= nil and M.filterVirsiBle(line_num) == false then -- 清理空行虚拟文本
        -- clear blank line
        M.delVirTool(mrk)
      end
    end
  end
end


function M.initVirTool_()
  if M.fileRules() == true then
    return
  end
  local cur_line =  vim.fn.line('.')
  local max_line = vim.fn.line('$')
  local count = 0
  for line = 1, M.scope,1 do
    count = count+1
    if M.filterVirsiBle(cur_line-line)  then
      M.StartVisible(cur_line-line,-1,M.OverVirTualChara_c,count)
    end
    count = count+1
    if M.filterVirsiBle(cur_line+line) then
      M.StartVisible(cur_line+line,-1,M.OverVirTualChara_c,count)
    end
  end
  M.StartVisible(cur_line,-1,M.OverVirTualChara_c,count+1)
end



local opts = {
  overlay_start = true,
  OverVirTualChara_c = '  .-||>',
  rules_file = {'startify','NvimTree','Trouble','Outline','packer','lsp-installer','toggleterm','CompetiTest','markdown'},
  scope = 35
}

function M.setup(opts)
  M.overlay_start = opts.overlay_start
  M.rules_file = opts.rules_file
  M.OverVirTualChara_c = opts.OverVirTualChara_c
  M.scope = opts.scope
  -- 初始化id组
  M.table_id = {}
  M.ns_id = vim.api.nvim_create_namespace('OverVirTualChara')
  if M.overlay_start  then
    vim.cmd[[ 
    augroup MyFunVirReturnText
      au!
      au TextChanged,InsertLeave * lua require('overvir').initVirTool_() 
      au BufEnter,InsertLeave,CursorMovedI,TextChanged,CursorMoved * lua require('overvir').initVirTool_()
    augroup END
    ]]
  end
end

return M
