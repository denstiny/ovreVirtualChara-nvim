" @author      : aero (2254228017@qq.com)
" @file        : OverVirtualChara
" @created     : 星期二 3月 01, 2022 16:42:13 CST 
" @github      : https://github.com/denstiny
" @blog        : https://denstiny.github.io

exec 'hi def Activitycharacter guibg=' . synIDattr(hlID('CursorLine'),'bg') 'guifg=' . synIDattr(hlID('Number'),'fg')
exec 'hi def Inactivecharacters guibg=' . synIDattr(hlID('SignColumn'),'bg') 'guifg=' . synIDattr(hlID('LineNr'),'fg')
