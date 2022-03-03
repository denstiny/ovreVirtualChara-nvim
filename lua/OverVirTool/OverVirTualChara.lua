local M = {}

local ns_id = vim.api.nvim_create_namespace('OverVirTualChara')
local overlay_start = true
local rule_file = {'startify','NvimTree','Trouble','Outline','packer','lsp-installer','toggleterm','help','CompetiTest'}

---------------------------------------------------------------
--- 创建虚拟文本
---@param line_num 行 位置
---@param col_num 列 位置
---@param character 虚拟文本
---@return 
function M.StartVisible(line_num,col_num,character,id)
  local bnr = vim.fn.bufnr('%')
  local Cur_line = vim.fn.line('.')
  local virt_text = {}
  if line_num == Cur_line then
    table.insert(virt_text, { character, "Activitycharacter" })
  else
    table.insert(virt_text, { character, "Inactivecharacters" })
  end

  local opts = {
    end_line = 1,
    id = id,
    virt_text = virt_text,
    virt_text_pos = "overlay",
  }

  return {
    markid = vim.api.nvim_buf_set_extmark(bnr, ns_id, line_num - 1, col_num, opts),
    bnr = bnr,
    ns_id = ns_id,
    id = id,
  }
end
---------------------------------------------------------------
--- 删除虚拟文本
---@param mrk 
function M.delVirTool(mrk)
  vim.api.nvim_buf_del_extmark(mrk.bnr,mrk.ns_id,mrk.id)
end
---------------------------------------------------------------
--- 过滤不想打印的行
---@param line 
---@return 
function M.filterVirsiBle(line)
  local str_len = vim.fn.split(vim.fn.getline(line))
  --print("行号: " .. line .. " 数量: " .. #str_len)
  if #str_len >= 1 then
    return true
  end
  return false
end
--M.StartVisible(vim.fn.line('.'),-1,'.-',1)
--M.filterVirsiBle(vim.fn.line('.'))
---------------------------------------------------------------
--- 查找文件类型
function M.fileRules()
  for file_week =1, #rule_file do
    if rule_file[file_week] == vim.bo.filetype then
      return true
    end
  end
  return false
end
M.fileRules()
return M
