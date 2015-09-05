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
Plugin 'VundleVim/Vundle.vim'
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
"-------------------------------------------------------------------------------------------------------------
"
" CtrlP 与 ctrlp-funky
" 搜索工作目录下目录名与文件名的插件与函数导航插件
"
source ~/.vim/config/plugin/ctrlp.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" CtrlSF
" 使 ag/ack 的搜索结果从单行变成同时显示多行搜索结果的上下文的插件，需要先安装 ag 或 ack 插件
"
" 插件安装与配置：
source ~/.vim/config/plugin/ctrlsf.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-easymotion
" 快速搜索／跳转插件
"
" 插件安装与配置：
source ~/.vim/config/plugin/vim-easymotion.vim
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
"-------------------------------------------------------------------------------------------------------------
"
" vim-surround
" 快速为字符串包围／改变或者去除引号／括号或者HTML标签
"
" 插件安装：
Plugin 'tpope/vim-surround'
"
"-------------------------------------------------------------------------------------------------------------
"
" Goyo
" 类似 IA Writer 的全屏写作模式插件
"
" 插件安装与配置：
source ~/.vim/config/plugin/goyo.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-airline
" 底部信息栏增强显示插件
"
" 插件安装与配置
source ~/.vim/config/plugin/vim-airline.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" rainbow_parentheses
" 成对括号显示增强插件
"
" 插件安装与配置
source ~/.vim/config/plugin/rainbow_parentheses.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" gundo
" 编辑文件时可以恢复到任意修改点的插件
"
" 插件安装：
Plugin 'https://github.com/sjl/gundo.vim'
"
" 插件配置：
" 修改启动此功能的快捷键
nnoremap <F5> :GundoToggle<CR>

" 开启保存 undo 历史功能,使退出后下次编辑文件还能使用,必须设置下面的历史保存路径
set undofile

" undo 历史保存路径
set undodir=~/.vim/vimdata/undo_history/
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
"
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
"-------------------------------------------------------------------------------------------------------------
"
" 添加软件注释的插件
"
" 插件安装：
Plugin 'scrooloose/nerdcommenter'
"
" 插件配置：
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
" YouCompleteMe
" 自动补全插件
"
" 插件安装与配置
source ~/.vim/config/plugin/youcompleteme.vim
"
"
"-------------------------------------------------------------------------------------------------------------
"
" vim-signature
" 书签可视化的插件
"
" 插件安装与配置
source ~/.vim/config/plugin/vim-signature.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" a.vim
" 在C语言头文件和源代码之间跳转
"
" 插件安装：
Plugin 'vim-scripts/a.vim'
"
" 插件配置：
" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或 *.h
nmap <Leader>sch :AS<CR>

"-------------------------------------------------------------------------------------------------------------
"
" indexer.vim
" 根据编辑的文件自动生成与更新ctags文件
"
" 插件安装与配置
source ~/.vim/config/plugin/indexer.vim
"
"-------------------------------------------------------------------------------------------------------------
"
" 下面的插件自动生效，不需要配置与调用
"
"-------------------------------------------------------------------------------------------------------------
"
" YouCompleteMe 通过 jedi插件来补全Python
Plugin 'davidhalter/jedi'
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
"
" 建立一个关键词列表进行索引跳转的插件
Plugin 'vim-scripts/TaskList.vim'

" Adds Swift support to vim. It covers syntax, intenting, and more.
Plugin 'toyamarinyon/vim-swift'

" STL、C++14 新增元素语法高亮
Plugin 'Mizuchi/STL-Syntax'
"
"-------------------------------------------------------------------------------------------------------------
"
"************************************所有插件的安装配置必需在此行之前*****************************************
"
call vundle#end()
"
" 开启文件类型侦测
filetype on

" 根据侦测到的不同类型加载对应的插件与文件缩进，Vundle 必需配置
filetype plugin on
"
" 自适应不同语言的智能缩进
filetype indent on

" 开启语法高亮功能
syntax enable

" 允许用指定语法高亮配色方案替换默认方案
syntax on
