"-------------------------------------------------------------------------------------------------------------
"
" 开始使用 Vundle 的必须配置
set nocompatible                                   " 不兼容老版本vi来使用Vim新版本的高级特性
filetype off                                       " 关闭文件类型检测
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
"-------------------------------------------------------------------------------------------------------------
"
" 使用Vundle来管理它自己
"
" 安装 Vundle 插件：
Plugin 'gmarik/Vundle.vim'
"
" 插件使用说明：
" 可以在 Vim Ex 模式下执行的Vundle命令
"   :PluginList             -列举列表(也就是.vimrc)中配置的所有插件
"   :PluginInstall          -安装列表中的全部插件
"   :PluginInstall!         -升级全部插件到最新版本
"   :PluginSearch foo       -查找foo插件
"   :PluginSearch! foo      -刷新foo插件缓存
"   :PluginClean            -清除列表中没有的插件
"   :PluginClean!           -清除列表中没有的插件
"
"-------------------------------------------------------------------------------------------------------------
"
"****************************************所有插件的安装配置必需在此行之后*************************************
"
" 可以通过以下四种方式指定插件的来源
" 1) 安装 www.vim-scripts.com 网站中的插件，直接使用插件名称即可，插件名中的空格使用“-”代替。
" 例子：
" Plugin 'L9'
"
" 2) 安装 www.github.com 中的插件，使用“用户名/插件名称”的方式安装
" 例子：
" Plugin 'tpope/vim-fugitive'
"
" 3) 指定非Github的Git仓库的插件，需要使用git地址
" 例子：
" Plugin 'git://git.wincent.com/command-t.git'
"
" 4) 指定本地Git仓库中的插件
" 例子：
" Plugin 'file:///home/gmarik/path/to/plugin'
"
"-------------------------------------------------------------------------------------------------------------
"
" CoVim
" 团队协作插件，通过网络多人同时编辑一个文件
"
" 插件安装与配置：
source ~/.vim/config/plugin/covim.vim
"
" 插件使用说明：
" To start a new CoVim server: :CoVim start [port] [name] (or, from the command line: ./CoVimServer.py [port])
" To connect to a running server: :CoVim connect [host address / 'localhost'] [port] [name]
" To disconnect: :CoVim disconnect
" To quit Vim while CoVim is connected: :CoVim quit or :qall!
"
"-------------------------------------------------------------------------------------------------------------
"
" syntastic
" 语法检测插件
"
" 插件安装与配置：
source ~/.vim/config/plugin/syntastic.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" Ag
" 快速搜索目录下全部文件内的关键词的插件，需要安装客户端（比ack速度要快）
"
" 插件安装与配置：
source ~/.vim/config/plugin/ag.vim
"
" 插件使用说明：
" 命令格式：
" Ag [options] {pattern} [{directory}]
"
" 键盘快捷键：
" In the quickfix window, you can use:
" e    to open file and close the quickfix window
" o    to open (same as enter)
" go   to preview file (open but maintain focus on ag.vim results)
" t    to open in new tab
" T    to open in new tab silently
" h    to open in horizontal split
" H    to open in horizontal split silently
" v    to open in vertical split
" gv   to open in vertical split silently
" q    to close the quickfix window
"
"-------------------------------------------------------------------------------------------------------------
"
" CtrlSF
" 使 ag/ack 的搜索结果从单行变成同时显示多行搜索结果的上下文的插件，需要先安装 ag 或 ack 插件
"
" 插件安装与配置：
source ~/.vim/config/plugin/ctrlsf.vim
"
" 插件使用说明：
" 键盘快捷键：
" 下面的命令只能在 CtrlSF 窗口中使用：
" o, Enter - Jump to file that contains the line under cursor.
" t - Like o but open file in a new tab.
" p - Like o but open file in a preview window.
" O - Like o but always leave CtrlSF window opening.
" T - Lkie t but focus CtrlSF window instead of opened new tab.
" q - Quit CtrlSF window.
" <C-J> - Move cursor to next match.
" <C-K> - Move cursor to previous match.
" In preview window:
" q - Close preview window.
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-easymotion
" 快速搜索／跳转插件
"
" 插件安装与配置：
source ~/.vim/config/plugin/vim-easymotion.vim
"
" 插件使用说明：
"
" vim-easymotion 默认的快捷键：
" 把下面的内容按单词快速搜索跳转
" <Leader><Leader>w
" 通过一个字符进行搜索跳转
" <Leader><Leader>f
"
" 其它快捷键：
" 通过一个或两个字符进行搜索跳转
" 按 s 后输入一个或两个要跳转位置的字符，按红色字母跳转到红色字母所在位置，按 t 跳转到前一个字符
" 快速跳转到行
" 输入<Leader>j 或 <Leader>k 后输入下面行首出现的红色字母快速跳转到红色字母所在行
" 代替 Vim 的 / 搜索功能，在 NORMAL 模式下输入 / 后输入要搜索的关键词后按回车，按 n 或 N 键跳转到上一个或下一个搜索的关键词
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-fugitive
" Git 分支管理的插件
"
" 插件安装与配置：
source ~/.vim/config/plugin/vim-fugitive.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" nerdtree 与 vim_nerdtree_tabs
" 显示目录树与加强功能的插件
"
" 插件安装与配置：
source ~/.vim/config/plugin/nerdtree.vim
"
" 插件使用说明：
" 按 F8 打开／关闭目录树
"
" 常用的快捷键：
" j、k 分别下、上移动光标
" o 或者回车打开文件或是文件夹，如果是文件的话，光标直接定位到文件中，想回到目录结构中，按住 Ctrl，然后点两下 w 就回来了
" go 打开文件，但是光标不动，仍然在目录结构中
" i、s 分别是水平、垂直打开文件，就像vim命令的 :vs、:sp一样
" gi、gs 水平、垂直打开文件，光标不动
" p 快速定位到上层目录
" P 快速定位到根目录
" K、J 快速定位到同层目录第一个、最后一个节点
" q 关闭
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-multiple-cursors
" 选择多个文本、修改的插件
"
source ~/.vim/config/plugin/vim-multiple-cursors.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-startify
" 自定义 Vim 启动时显示的默认信息插件
"
" 插件安装与配置
source ~/.vim/config/plugin/vim-startify.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-gitgutter
" 显示 git 差异对比插件
"
" 插件安装与配置
source ~/.vim/config/plugin/vim-gitgutter.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" numbers.vim
" 智能显示相对行号的插件
"
" 插件安装与配置
source ~/.vim/config/plugin/numbers.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" Tagbar
" 一款基于ctags,显示当前的代码结构概览,增加代码浏览的便利程度的插件
"
" 插件安装与配置
source ~/.vim/config/plugin/tagbar.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-indent-guides
" 显示缩进对齐线的插件
"
" 插件安装与配置：
source ~/.vim/config/plugin/vim-indent-guides.vim
"
" 插件使用说明：
" 输入 <leader>si 打开或关闭显示对齐线
"
"-------------------------------------------------------------------------------------------------------------
"
" 快速为字符串包围／改变或者去除引号／括号或者HTML标签
"
" 插件安装：
Plugin 'tpope/vim-surround'
"
" 插件使用说明：
" 在命令模式下，使用 ysiw" 就可以为当前光标所在的单词包围上双引号
" yssb  可以快速为一行包围圆括号
" yss" 为一行包围双引号
" ySS 在上一行与下一行添加符号
" cs"( 是将双引号变成圆括号
" cst<p> 把 <> 标签里的内容改成 <p> 标签
" cst" 是将 <p> 这种类型的包围替换成双引号
" ds"  是去除双引号包围
" dst  是删除 <div> 这种类型的包围
"
"-------------------------------------------------------------------------------------------------------------
"
" Goyo
" 类似 IA Writer 的全屏写作模式插件
"
" 插件安装与配置：
source ~/.vim/config/plugin/goyo.vim
"
" 插件使用说明：
" 输入 <leader>z 打开IA Writer全屏写作模式
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-airline 是 Vim 底部信息栏增强显示插件
"
" 插件安装与配置
source ~/.vim/config/plugin/vim-airline.vim
"
" 插件使用说明
" 使用 <Leader>1 至 <Leader>9 切换顶部各个 buffer
"
"-------------------------------------------------------------------------------------------------------------
"
" 成对括号显示增强插件
"
" 插件安装与配置
source ~/.vim/config/plugin/rainbow_parentheses.vim

" 插件使用说明
" :RainbowParenthesesToggle                        " Toggle it on/off
" :RainbowParenthesesLoadRound                     " (), the default when toggling
" :RainbowParenthesesLoadSquare                    " []
" :RainbowParenthesesLoadBraces                    " {}
" :RainbowParenthesesLoadChevrons                  " <>
"
"-------------------------------------------------------------------------------------------------------------
"
" 编辑文件时可以恢复到任意修改点的插件
"
" 插件安装：
Plugin 'https://github.com/sjl/gundo.vim'
"
" 插件配置：
" 修改启动此功能的快捷键
nnoremap <F5> :GundoToggle<CR>
"
" 插件使用说明：
" 按 <F5> 启动此功能，在左侧选择恢复的时间点后按回车键
"
"-------------------------------------------------------------------------------------------------------------
"
" tabular
" 让代码更加易于纵向排版，以=或,符号对齐
"
" 插件安装：
Plugin 'godlygeek/tabular'
"
" 插件配置：
        if isdirectory(expand("~/.vim/bundle/tabular"))
            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /=<CR>
            vmap <Leader>a= :Tabularize /=<CR>
            nmap <Leader>a=> :Tabularize /=><CR>
            vmap <Leader>a=> :Tabularize /=><CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
"
" 插件使用说明：
" 在 Vim Ex 模式输入 :Tabularize /= 则按照 ＝ 号对齐，其他符号使用方法一样
" 如果在 VISUAL 模式下选择多行文本后执行，则只对选择的行生效
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-markdown
" Markdown 语法插件，依赖 tabular 插件
Plugin 'plasticboy/vim-markdown'
"
"-------------------------------------------------------------------------------------------------------------
"
" css
" css 语法插件
Plugin 'JulesWang/css.vim'
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-css3-syntax
" css3 语法插件，依赖 css.vim 插件
Plugin 'hail2u/vim-css3-syntax'
"
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-less
" Less 语法与转换成 Css 文件的插件
Plugin 'groenewege/vim-less'

nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-easy-align
" 按照空格、＝号、:号快速自动对齐的插件
"
" 插件安装：
Plugin 'junegunn/vim-easy-align'

" 插件配置：
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"-------------------------------------------------------------------------------------------------------------
"
" javascript 语法插件
"
" 插件安装
Plugin 'Pangloss/vim-javascript'

" 插件配置
set regexpengine=1

"-------------------------------------------------------------------------------------------------------------
"
" 快速写Html、Css代码的插件
"
" 插件安装：
Plugin 'mattn/emmet-vim'

" 插件配置：
"
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

" let g:emmet_html5 = 0

" 此插件只有在html、css文件生效
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
"
" 更改触发键:
" let g:user_emmet_leader_key='<C-Y>'
" let g:user_emmet_expandabbr_key='<Leader>'
"
" 插件使用说明：
" 编辑一个 .html 文件，输入 html:5 后 按 Ctrl ＋Y  然后输入 Leader 键
"
"-------------------------------------------------------------------------------------------------------------
"
" 添加软件注释的插件
"
" 插件安装：
Plugin 'scrooloose/nerdcommenter'
"
" 插件使用说明：
" Comment out the current line or text selected in visual mode.
" [count]<leader>cc |NERDComComment|
"
" Same as <leader>cc but forces nesting.
" [count]<leader>cn |NERDComNestedComment|
"
" Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
" [count]<leader>c |NERDComToggleComment|
"
" Comments the given lines using only one set of multipart delimiters.
" [count]<leader>cm |NERDComMinimalComment|
"
" Toggles the comment state of the selected line(s) individually.
" [count]<leader>ci |NERDComInvertComment|
"
" Comments out the selected lines ``sexily''
" [count]<leader>cs |NERDComSexyComment|
"
" Same as <leader>cc except that the commented line(s) are yanked first.
" [count]<leader>cy |NERDComYankComment|
"
" Comments the current line from the cursor to the end of line.
" <leader>c$ |NERDComEOLComment|
"
" Adds comment delimiters to the end of line and goes into insert mode between them.
" <leader>cA |NERDComAppendComment|
"
" Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
" |NERDComInsertComment|
"
" Switches to the alternative set of delimiters.
" <leader>ca |NERDComAltDelim|
"
" 为选择行添加对齐的注释，对齐方式为左对齐(<leader>cl) 或两头对齐 (<leader>cb).
" [count]<leader>cl
" [count]<leader>cb |NERDComAlignedComment|
"
" 删除选择行的注释
" [count]<leader>cu |NERDComUncommentLine|
"
"-------------------------------------------------------------------------------------------------------------
"
" CtrlP 与 ctrlp-funky
" 搜索工作目录下目录名与文件名的插件与函数导航插件
"
source ~/.vim/config/plugin/ctrlp.vim
"
" 插件使用说明:
" 运行 :CtrlP 或 :CtrlP 要检索的目录 来运行CtrlP，也可以在 Vim 的 NORMAL 模式下用快捷键 <Leader><Ctrl+P> 来运行
" Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode.
" Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.
" Check :help ctrlp-commands and :help ctrlp-extensions for other commands.
"
" 以下快捷键在 CtrlP 打开时才能在下方 CtrlP 窗口内使用:
" 按 <F5> 为当前目录清除缓存来显示新的文件，去除已删除的文件和应用新的忽略选项
" Press <c-f> and <c-b> to cycle between modes
" 输入 <ctrl＋d> 切换在目录名还是在文件名搜索关键词
" Press <c-r> to switch to regexp mode
" Use <c-j>, <c-k> or the arrow keys to navigate the result list
" 选择文件后按 <ctrl＋t> 用新的 Tab 打开，<ctrl＋v> 用新的竖屏分割打开， <ctrl+x> 用新的横屏分割打开
" 按 <ctrl＋n> 或 <ctrl＋p> 来切换前一个或后一个执行过的命令历史记录
" 输入一个要建立的新文件名后输入 <ctrl＋y> 自动创建这个文件，如果这个文件的路径目录不存在，自动建立目录.
" 用 <ctrl＋z> 选择或者取消选择多个文件， 选择后按 <ctrl＋o> 打开这些文件.
"
"-------------------------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------------------------
"
" 下面的插件自动生效，不需要配置与调用
"
"-------------------------------------------------------------------------------------------------------------
"
" 自动检测打开文件的编码的插件
Plugin 's3rvac/AutoFenc'

" 将行末最后的多余空格显示出来的插件
Plugin 'bronson/vim-trailing-whitespace'

" 输入引号、括号时自动补全插件
Plugin 'Raimondi/delimitMate'

" Html5 语法高亮显示插件
Plugin 'othree/html5.vim'
"
" 在 Css 文件颜色代码背景上显示此代码所代表的颜色
Plugin 'lilydjwg/colorizer'

" 编译 CoffeeScript 为 JavaScript 的插件
Plugin 'kchmck/vim-coffee-script'

" 源码提示插件
" Plugin 'Valloric/YouCompleteMe'
"
" 建立一个关键词列表进行索引跳转的插件
Plugin 'vim-scripts/TaskList.vim'
"
"-------------------------------------------------------------------------------------------------------------
"
"************************************所有插件的安装配置必需在此行之前*****************************************
"
call vundle#end()
"
filetype plugin indent on                          " 文件检测类型与文件缩进，Vundle 必需配置
syntax enable                                      " 语法高亮显示
"
