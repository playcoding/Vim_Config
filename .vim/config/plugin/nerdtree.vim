" nerdtree
" 显示目录树的插件
"
" 插件安装：
Plugin 'scrooloose/nerdtree'
"
" 插件配置：
" 设置 打开／关闭 目录树的快捷键
map <F2> :NERDTreeToggle<CR>

"---------------------------------------------------------------------------------------------------
"
" NERDTree-Tabs 提供了很多 NERDTree 的加强功能，包括保持目录树状态、优化tab标题等
Plugin 'jistr/vim-nerdtree-tabs'
"
if isdirectory(expand("~/.vim/bundle/nerdtree"))
    map <F2> <plug>NERDTreeTabsToggle<CR>
    map <leader>ntf :NERDTreeFind<CR>
    nmap <leader>ntf :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    " 启动 GVim 图形界面窗口时打开目录树窗口
    let g:nerdtree_tabs_open_on_gui_startup=0
    " 启动 Vim 终端版本时打开目录树窗口
    " let g:nerdtree_tabs_open_on_console_startup=1
endif
