" vim-indent-guides
" 显示缩进对齐线的插件
"
" 插件安装：
Plugin 'nathanaelkane/vim-indent-guides'
"
" 插件配置：
set ts=4 sw=4 et                                   " 缩进对齐线之间间隔几个字符距离
let g:indent_guides_start_level = 2                " 从第几级开始显示缩进对齐线
let g:indent_guides_guide_size  = 1                " 缩进对齐线的宽度是几个字符
let g:indent_guides_enable_on_vim_startup = 1      " Vim 启动时是否显示缩进线
let g:indent_guides_color_change_percent = 5
"
"
" 设定打开与关闭显示缩进线的快捷键
nmap <silent> <Leader>si <Plug>IndentGuidesToggle
"
" 手动设定缩进线的颜色
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=10
