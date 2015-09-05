" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
" syntax enable
set background=dark
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
let g:solarized_termcolors=256
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1


" 禁止光标闪烁
" set gcr=a:block-blinkon0


set guioptions-=m  " 禁止显示菜单
set guioptions-=T  " 禁止显示工具条

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r  "no scrollbar
set guioptions-=R


set laststatus=2                                             " 底部状态栏显示两行
set t_Co=256                                                 " 指定配色方案为256色


if has("gui_gtk2")

    set guifont=Sauce\ Code\ Powerline\ 14            " Vim界面使用的字体
"    set guifontwide=Source\ Code\ Pro\ for\ Powerline\ 14        " Vim界面使用的字体

elseif has("gui_macvim")

    set guifont=Sauce_Code_Powerline:h14            " Vim界面使用的字体

elseif has("gui_win32")

    set guifont=Sauce_Code_Powerline:h11
end

" Ubuntu 终端下Vim标准模式下光标显示成方块，插入模式下光标显示成竖线
if has("gui_gtk2")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif

" MacVIM 设置成中文菜单栏
set langmenu=zh_CN.UTF-8
