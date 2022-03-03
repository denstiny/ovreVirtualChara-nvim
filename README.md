<!-- vim-markdown-toc GFM -->

* [OverVirTualChara-nvim](#overvirtualchara-nvim)
  * [演示](#演示)
  * [安装](#安装)
  * [配置](#配置)

<!-- vim-markdown-toc -->
# OverVirTualChara-nvim  
> 使用虚拟文本来显示特殊符号  
> 强迫症患者救赎者
## 演示

![](https://www.hualigs.cn/image/621e2a7770341.jpg) 
## 安装
> packer
```vim
use 'denstiny/ovreVirtualChara-nvim'
```
> plugin
```vim
plug 'denstiny/ovreVirtualChara-nvim'
```

## 配置
> lua 
```lua
local opts = {
  overlay_start = true,
  OverVirTualChara_c = '  .-||>',
  rules_file = {'startify','NvimTree','Trouble','Outline','packer','lsp-installer','toggleterm','help','CompetiTest'}
}
require('overvir').setup(opts)
```
