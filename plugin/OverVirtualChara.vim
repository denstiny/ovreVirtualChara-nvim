" @author      : aero (2254228017@qq.com)
" @file        : OverVirtualChara
" @created     : ζζδΊ 3ζ 01, 2022 16:42:13 CST 
" @github      : https://github.com/denstiny
" @blog        : https://denstiny.github.io

exec 'hi def Activitycharacter guibg=' . synIDattr(hlID('CursorLine'),'bg') 'guifg=' . synIDattr(hlID('IndentBlanklineContextChar'),'fg')
exec 'hi def Inactivecharacters guibg=' . synIDattr(hlID('SignColumn'),'bg') 'guifg=' . synIDattr(hlID('LineNr'),'fg')
